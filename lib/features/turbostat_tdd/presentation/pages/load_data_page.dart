import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
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
                alignment: Alignment.centerLeft,
                height: 50,
                child: DropdownCarButton(
                  listAll: state.listAll,
                ),
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

class DropdownCarButton extends StatefulWidget {
  final List<CarModel> listAll;
  const DropdownCarButton({
    @required this.listAll,
    Key key,
  }) : super(key: key);

  @override
  _DropdownCarButtonState createState() => _DropdownCarButtonState(listAll);
}

class _DropdownCarButtonState extends State<DropdownCarButton> {
  List<CarModel> listAll;
  _DropdownCarButtonState(this.listAll);
  get dropDownItems => listAll.map<DropdownMenuItem<Text>>((v) {
    var text = v.carMark+' '+v.carModel +' '+v.carYear.toString();
        return DropdownMenuItem<Text>(
          child: Text(text),
        );
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: DropdownButton(
        items: dropDownItems,
        onChanged: (newValue) {
        },
      ),
    );
  }
}
