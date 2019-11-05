import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'package:turbostat_tdd/injection_container.dart';

class LoadDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
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
                Text('Empty State'),
              ],
            ),
          );
        }
        if (state is Loading) {
          return Container(
            child: Column(
              children: <Widget>[
                CustomCircleProgressBar(),
                Text('Loading State'),
              ],
            ),
          );
        }
        if (state is LoadedAllCars) {
          return Column(
            children: <Widget>[
              Container(
                height: 50,
                child: new DropdownCarButton(),
              ),
              Expanded(
                child: Placeholder(),
              ),
            ],
          );
        }
        return Container();
      }),
    );
  }
}

class DropdownCarButton extends StatelessWidget {
  const DropdownCarButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
