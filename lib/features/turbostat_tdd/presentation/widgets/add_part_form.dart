import 'package:flutter/material.dart';
import 'package:nanoid/async/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class AddPartForm extends StatefulWidget {
  AddPartForm({Key key}) : super(key: key);

  @override
  _AddPartFormState createState() => _AddPartFormState();
}

class _AddPartFormState extends State<AddPartForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String partId;
  String partName;
  String partCode;
  double partPrice;
  int partQnty;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                S.of(context).add_parts,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) => partName = value,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: S.of(context).name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) => partCode = value,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: S.of(context).code_article,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) => partPrice = double.parse(value),
                maxLines: 1,
                validator: (value) {
                  if (value.contains(',')) {
                    return S.of(context).form_validator_dot;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: S.of(context).cost,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '1',
                autocorrect: false,
                onSaved: (String value) => partQnty = int.parse(value),
                maxLines: 1,
                validator: (value) {
                  if (value.contains(',')) {
                    return S.of(context).form_validator_dot;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: S.of(context).quantity,
                ),
              ),
            ),
            Container(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 150.0),
                  child: RaisedButton(
                    child: Text(S.of(context).button_cancel),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'load_data_page');
                    },
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 150.0),
                  child: RaisedButton(
                    child: Text(S.of(context).button_save),
                    onPressed: _submitDetails,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submitDetails() async {
    final FormState formState = _formKey.currentState;

    if (!formState.validate()) {
      //     showSnackBarMessage(S.of(context).form_warning_fill_info);
    } else {
      formState.save();

      final String _carId =
          Provider.of<CurrentCar>(context, listen: false).currentCar.carId;

      for (int i = 0; i < partQnty; i++) {
        partId = await nanoid(4);
        final _result = PartModel(
            partId: partId,
            partName: partName,
            partCode: partCode,
            partPrice: partPrice);

        Provider.of<Parts>(context, listen: false).add(_carId, _result);
      }

      Navigator.pushReplacementNamed(context, 'load_data_page');
    }
  }
}
