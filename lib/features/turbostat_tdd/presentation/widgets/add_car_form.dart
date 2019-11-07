import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanoid/async/nanoid.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class AddCarForm extends StatefulWidget {
  const AddCarForm({Key key}) : super(key: key);

  @override
  _AddCarFormState createState() => _AddCarFormState();
}

class _AddCarFormState extends State<AddCarForm> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String carName;
  String carMark;
  int carYear;
  String carVin;
  String carModel;

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
                S.of(context).add_car_page_description,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: S.of(context).form_initial_my_car,
                autocorrect: false,
                onSaved: (String value) {
                  carName = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return S.of(context).form_validator_car_name;
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: S.of(context).form_decorator_car_name,
                    labelStyle: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '', // TODO add base cars and choise from the base
                autocorrect: false,
                onSaved: (String value) {
                  carMark = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return S.of(context).form_validator_car_mark;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: S.of(context).form_decorator_car_mark,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) {
                  carModel = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return S.of(context).form_validator_car_model;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: S.of(context).form_validator_car_model,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) {
                  carYear = int.parse(value);
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return S.of(context).form_validator_car_year;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: S.of(context).form_decorator_car_year,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) {
                  carVin = value;
                },
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: S.of(context).form_decorator_car_vin,
                ),
              ),
            ),
            Container(
              height: 30.0,
            ),
            RaisedButton(
              child: Text(S.of(context).button_save),
              onPressed: _submitDetails,
              color: Colors.yellow,
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
      final carGenId = await nanoid(4);
      final newCar = CarModel(
          carId: carGenId,
          carName: carName,
          carMark: carMark,
          carModel: carModel,
          carYear: carYear,
          carVin: carVin,
          carNote: '',
          licencePlate: '',
          tankVolume: 38,
          fuelType: 'petrol');

      BlocProvider.of<LoadDataBloc>(context).add(AddConcreteCar(car: newCar));

      print('after bloc');
    }
  }
}
