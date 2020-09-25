import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'package:turbostat_tdd/generated/i18n.dart';
import 'package:turbostat_tdd/injection_container.dart';

// При первом старте на странице добавления авто висит FAB
class LoadDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Контрольная панель',
            style: GoogleFonts.jura(),
          ),
          elevation: 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: buildFloatingActionButton(),
        bottomNavigationBar: BottomNavigation(),
        body: buildBody(context),
      ),
    );
  }

  Widget buildFloatingActionButton() {
    return Consumer<PageCounter>(
      builder: (context, page, child) {
        switch (page.pageIndex) {
          case 0: // history page
            return FloatingActionButton(
              onPressed: () {
                final carId = Provider.of<CurrentCar>(context, listen: false)
                    .currentCar
                    .carId;
                Provider.of<Maintenances>(context, listen: false)
                    .getAllMaintenances(carId);
                modalBottomSheet(context);
              },
              child: Icon(Icons.add),
            );
          case 2: // cars list page
            return FloatingActionButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, 'add_car');
              },
              child: Icon(Icons.add),
            );
        }
        return Visibility(
            visible: false,
            child: FloatingActionButton(
              onPressed: () {},
            ));
      },
    );
  }

  BlocProvider<LoadDataBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoadDataBloc>()..add(GetAllCar()),
      child:
          BlocBuilder<LoadDataBloc, LoadDataState>(builder: (context, state) {
        if (state is Loading) {
          return Center(child: CustomCircleProgressBar());
        }
        if (state is LoadedAllCars) {
          return state.listAll.isEmpty
              ? AddCarForm()
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: PageViewController(),
                    ),
                  ],
                );
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height,
        );
      }),
    );
  }

  modalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20))),
              child: Wrap(
                children: <Widget>[
                  Container(
                    height: 20.0,
                  ),
                  ListTile(
                    title: Text(S.of(context).add_maintenance_regular),
                    leading: Icon(Icons.calendar_today),
                    onTap: () {
                      Navigator.popAndPushNamed(context, 'add_maintenance');
                    },
                  ),
                  ListTile(
                    title: Text(S.of(context).add_maintenance_operation),
                    leading: Icon(Icons.build),
                    onTap: () {
                      final carId =
                          Provider.of<CurrentCar>(context, listen: false)
                              .currentCar
                              .carId;
                      Provider.of<MileageProvider>(context, listen: false)
                          .getLastMileage(carId);
                      Provider.of<PartsCart>(context, listen: false)
                          .clearCart();
                      Provider.of<Parts>(context, listen: false).update(carId);
                      Navigator.popAndPushNamed(context, 'add_entry');
                    },
                  ),
                  ListTile(
                    title: Text('Записать покупку запчастей / расходников'),
                    leading: Icon(Icons.add_shopping_cart),
                    onTap: () {
                      Navigator.popAndPushNamed(context, 'add_part');
                    },
                  ),
/*                   ListTile(
                    title: Text(S.of(context).button_cancel),
                    leading: Icon(Icons.subdirectory_arrow_left),
                    onTap: () => Navigator.pop(context),
                  ), */
                  Container(
                    height: 10.0,
                  )
                ],
              ),
            ),
          );
        });
  }
}
