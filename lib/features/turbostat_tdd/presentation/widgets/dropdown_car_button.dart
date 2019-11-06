import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

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
        var text = v.carMark + ' ' + v.carModel + ' ' + v.carYear.toString();
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
        onChanged: (newValue) {},
      ),
    );
  }
}
