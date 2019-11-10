import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_tdd/core/util/util.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'package:turbostat_tdd/injection_container.dart';

class CarListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildPageBody(context);
  }

  BlocProvider<LoadDataBloc> buildPageBody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<LoadDataBloc>()..add(GetAllCar()),
      child: BlocBuilder<LoadDataBloc, LoadDataState>(
        builder: (context, state) {
          if (state is Loading) {
            return CustomCircleProgressBar();
          }
          if (state is LoadedAllCars) {
            return ListView.builder(
              itemCount: state.listAll.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final pref = await SharedPreferences.getInstance();
                            pref.setString('carId', state.listAll[index].carId);

                            Provider.of<PageCounter>(context).updateIndex(0);

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  state.listAll[index].carMark,
                                ),
                              ),
                              SizedBox(width: 12,),
                              Container(
                                child: Text(
                                  state.listAll[index].carModel,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline),
                        onPressed: () async {
                          final String carKey = state.listAll[index].carId;
                          BlocProvider.of<LoadDataBloc>(context)
                              .add(DeleteConcreteCar(carKey: carKey));
                          BlocProvider.of<LoadDataBloc>(context)
                              .add(GetAllCar());
                          // TODO add AlertDialog
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
