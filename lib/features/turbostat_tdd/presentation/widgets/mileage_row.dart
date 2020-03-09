import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_car_mileage.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_car_mileage.dart';
import 'package:turbostat_tdd/generated/i18n.dart';
import 'package:turbostat_tdd/injection_container.dart';

class MileageRowWidget extends StatefulWidget {
  const MileageRowWidget({
    Key key,
    @required TextEditingController textFieldController,
    String carId,
  })  : _textFieldController = textFieldController,
        _carId = carId,
        super(key: key);

  final TextEditingController _textFieldController;
  final String _carId;

  @override
  _MileageRowWidgetState createState() => _MileageRowWidgetState();
}

class _MileageRowWidgetState extends State<MileageRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FutureBuilder(
          future: _getMileage(widget._carId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return Text(
                  snapshot.data.toString(),
                  style: Theme.of(context).textTheme.overline,
                );
              }
            }
            return Text('data not aviable');
          },
        ),
        GestureDetector(
          onTap: () async {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: TextField(
                      controller: widget._textFieldController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText:
                              S.of(context).car_card_enter_current_mileage),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text(
                          S.of(context).button_cancel,
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text(
                          S.of(context).button_save,
                        ),
                        onPressed: () async {
                          final _entry = MileageModel(
                            mileageDateTime: DateTime.now(),
                            mileage:
                                int.parse(widget._textFieldController.text),
                          );
                          await sl<AddCarMileage>()
                              .addCarMileage(widget._carId, _entry);
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Icon(
              Icons.edit,
              size: 18.0,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }

  _getMileage(String carId) async {
    final _res = await sl<GetCarMileage>().call(Params(carId: carId));
    return _res.fold(
      (failure) => null,
      (_res) => _res.mileage,
    );
  }
}
