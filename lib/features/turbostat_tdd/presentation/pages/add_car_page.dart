import 'package:flutter/material.dart';

class AddCarPage extends StatefulWidget {
  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String carName;

  String carMark;

  int carYear;

  String carVin;

  String carModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'description of page',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: 'S.of(context).form_initial_my_car',
                autocorrect: false,
                onSaved: (String value) {
                  carName = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'S.of(context).form_validator_car_name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'S.of(context).form_decorator_car_name',
                    labelStyle: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                    )),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) {
                  carMark = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'S.of(context).form_validator_car_mark';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'S.of(context).form_decorator_car_mark',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) {
                  carModel = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'S.of(context).form_validator_car_model';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'S.of(context).form_validator_car_model',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) {
                  carYear = int.parse(value);
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'S.of(context).form_validator_car_year';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'S.of(context).form_decorator_car_year',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) {
                  carVin = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'S.of(context).form_validator_car_vin';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'S.of(context).form_decorator_car_vin',
                ),
              ),
              Container(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'car_list_page');
                    },
                    child: Text(
                      'S.of(context).button_cancel',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  FlatButton(
                    child: Text('S.of(context).button_save'),
                    onPressed: _submitDetails,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitDetails() {
    final FormState formState = _formKey.currentState;

    if (!formState.validate()) {
      //     showSnackBarMessage(S.of(context).form_warning_fill_info);
    } else {
      formState.save();
    }
  }
}
