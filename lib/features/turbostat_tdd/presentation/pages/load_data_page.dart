import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/pages.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'package:turbostat_tdd/injection_container.dart';

class LoadDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigation(),
      body: buildBody(context),
    );
  }

  BlocProvider<LoadDataBloc> buildBody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<LoadDataBloc>(),
      child:
          BlocBuilder<LoadDataBloc, LoadDataState>(builder: (context, state) {
        BlocProvider.of<LoadDataBloc>(context).add(GetAllCar());
//            state = Loading();
        if (state is InitialLoadDataState) {
          return Container(
            child: Column(
              children: <Widget>[
                CustomCircleProgressBar(),
                //Text('Empty State'),
              ],
            ),
          );
        }
        if (state is Loading) {
          return Container(
            child: Column(
              children: <Widget>[
                CustomCircleProgressBar(),
                //Text('Loading State'),
              ],
            ),
          );
        }
        if (state is LoadedAllCars) {
          //print(state.listAll);
          return state.listAll.isEmpty
              ? AddCarForm()
              : Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight),
                      child: DropdownCarButton(
                        listAll: state.listAll,
                      ),
                    ),
                    Expanded(
                      child: new MainPageView(),
                    ),
                  ],
                );
        }
        return Container();
      }),
    );
  }
}

class MainPageView extends StatefulWidget {
  const MainPageView({
    Key key,
  }) : super(key: key);

  @override
  _MainPageViewState createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HistoryPage(),
        StatsPage(),
        CarListPage(),
        SettingPage(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      //bottomSelectedIndex = index;
    });
  }
}
