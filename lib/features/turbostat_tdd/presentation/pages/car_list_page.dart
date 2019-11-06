import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      builder: (_) => sl<LoadDataBloc>(),
      child: BlocBuilder<LoadDataBloc, LoadDataState>(
        builder: (context, state) {
          BlocProvider.of<LoadDataBloc>(context).add(GetAllCar());

          if (state is InitialLoadDataState) {}
          if (state is Loading) {
            return CustomCircleProgressBar();
          }
          if (state is LoadedAllCars) {
            return ListView.builder(
              itemCount: state.listAll.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(
                  state.listAll[index].carMark,
                ));
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
