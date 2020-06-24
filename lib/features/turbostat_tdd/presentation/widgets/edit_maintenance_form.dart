import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class EditMaintenanceForm extends StatefulWidget {
  const EditMaintenanceForm({Key key}) : super(key: key);

  @override
  _EditMaintenanceFormState createState() => _EditMaintenanceFormState();
}

class _EditMaintenanceFormState extends State<EditMaintenanceForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String maintenanceId;
  String maintenanceName;
  int maintenanceMileageLimit;
  int maintenanceMonthLimit;
  MaintenanceModel _model;

  @override
  void initState() {
    _model = Provider.of<CurrentMaintenance>(context, listen: false)
        .currentMaintenance;
    super.initState();
  }

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
                S.of(context).add_entry_page_description,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: _model.maintenanceName,
                autocorrect: false,
                onSaved: (String value) {
                  maintenanceName = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return S.of(context).form_validator_car_name;
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: S.of(context).form_decorator_maintenance_name,
                    labelStyle: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: _model.maintenanceMileageLimit.toString(),
                autocorrect: false,
                onSaved: (String value) {
                  maintenanceMileageLimit = int.parse(value);
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return S.of(context).form_decorator_maintenance_interval_km;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText:
                      S.of(context).form_decorator_maintenance_interval_km,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: _model.maintenanceMonthLimit.toString(),
                autocorrect: false,
                onSaved: (String value) {
                  maintenanceMonthLimit = int.parse(value);
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return S.of(context).form_decorator_maintenance_interval;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: S.of(context).form_decorator_maintenance_interval,
                ),
              ),
            ),
            Container(
              height: 30.0,
            ),
            Consumer<CurrentCar>(
              builder: (context, car, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 150.0),
                    child: RaisedButton(
                      child: Text(S.of(context).button_cancel),
                      onPressed: () {
                        Navigator.pop(context);
                        //TODO при добавлении из списка отмена уводит на страницу настроек, а должна вернуть к списку
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
                      onPressed: () async =>
                          _submitDetails(car.currentCar.carId),
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _submitDetails(String carId) async {
    final FormState formState = _formKey.currentState;

    if (!formState.validate()) {
      //     showSnackBarMessage(S.of(context).form_warning_fill_info);
    } else {
      formState.save();

      final newMaintenance = MaintenanceModel(
        maintenanceId: _model.maintenanceId,
        maintenanceName: maintenanceName,
        maintenanceMileageLimit: maintenanceMileageLimit,
        maintenanceMonthLimit: maintenanceMonthLimit,
      );
      Provider.of<Maintenances>(context, listen: false)
          .add(newMaintenance, carId);

      Navigator.pushReplacementNamed(context, 'load_data_page');
    }
  }
}
