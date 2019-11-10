import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/core/util/current_car.dart';

class DropdownCarButton extends StatefulWidget {
  const DropdownCarButton({
    Key key,
  }) : super(key: key);

  @override
  _DropdownCarButtonState createState() => _DropdownCarButtonState();
}

class _DropdownCarButtonState extends State<DropdownCarButton> {
  String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentCar>(
      builder: (context, car, child) {
        return FlatButton(
          onPressed: () {},
          child: Text(car.currentCar.carMark),
        );
      },
    );
  }

/*  dropDownItems(List<CarModel> listAll) =>
      listAll.map<DropdownMenuItem<Text>>((v) {
        var text = v.carMark + ' ' + v.carModel + ' ' + v.carYear.toString();
        return DropdownMenuItem<Text>(
          child: Text(text),
        );
      }).toList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<LoadDataBloc>()..add(GetAllCar()),
      child: BlocBuilder<LoadDataBloc, LoadDataState>(
        builder: (context, state) {
          if (state is LoadedAllCars) {
            return Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: DropdownButton(
                items: dropDownItems(state.listAll),
                onChanged: (newValue) {},
              ),
            );
          }
          return Container();
        },
      ),
    );
  }*/
}
