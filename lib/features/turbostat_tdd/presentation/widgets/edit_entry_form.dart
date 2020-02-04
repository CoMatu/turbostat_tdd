import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/core/fixtures/date_validator.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class EditEntryForm extends StatefulWidget {
  @override
  _EditEntryFormState createState() => _EditEntryFormState();
}

class _EditEntryFormState extends State<EditEntryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controller;

  List<MaintenanceModel> _maintenances;

  //String entryId;
  String maintenanceId;
  String entryName;
  String entryNote;
  DateTime entryDateTime;
  double entryWorkPrice;
  int entryMileage;

  EntryModel _model;

  bool isVisible;

  int numberOfPart;

  @override
  void initState() {
    super.initState();
    var f = DateFormat('dd.MM.yyyy');
    _model = Provider.of<CurrentEntry>(context, listen: false).currentEntry;
    _maintenances =
        Provider.of<Maintenances>(context, listen: false).maintenances;
    _controller = TextEditingController(text: f.format(_model.entryDateTime));
    isVisible = false;
    numberOfPart = 0;
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
                S.of(context).add_operation_page_description,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      labelText:
                          S.of(context).form_decorator_select_maintenance,
                      labelStyle: TextStyle(fontSize: 22.0)),
                  isEmpty: maintenanceId == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: DropdownMenuItem(
                        value: _model.maintenanceId,
                        child: Text(_model?.entryName ?? ''),
                      ),
                      value: maintenanceId,
                      isDense: true,
                      isExpanded: true,
                      onChanged: (String newValue) {
                        setState(() {
                          maintenanceId = newValue;
                          state.didChange(newValue);
                        });
                      },
                      items: _maintenances.map((MaintenanceModel value) {
                        return DropdownMenuItem<String>(
                          value: value.maintenanceId,
                          child: Text(value.maintenanceName),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  print('value is Empty');
                  return S.of(context).form_warning_fill_info;
                }
                return null;
              },
            ),
            Row(children: <Widget>[
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                  labelText: S.of(context).form_decorator_date,
                ),
                controller: _controller,
                keyboardType: TextInputType.datetime,
                validator: (val) => DateValidator().isValidDate(val)
                    ? null
                    : S.of(context).form_validator_date_format,
                onSaved: (val) =>
                    entryDateTime = DateFormat('dd.MM.yyyy').parseStrict(val),
              )),
              IconButton(
                icon: Icon(Icons.more_horiz),
                tooltip: S.of(context).form_decorator_date_select,
                onPressed: (() {
                  assert(_controller.text != null);
                  _chooseDate(context, _controller.text);
                }),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: _model.entryMileage.toString(),
                autocorrect: false,
                onSaved: (String value) => entryMileage = int.parse(value),
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return S.of(context).form_decorator_car_mileage;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: S.of(context).form_decorator_odometer_value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: _model.entryWorkPrice.toString(),
                autocorrect: false,
                onSaved: (String value) => entryWorkPrice = double.parse(value),
                maxLines: 1,
                validator: (value) {
                  if (value.contains(',')) {
                    return S.of(context).form_validator_dot;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: S.of(context).form_decorator_value_work,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                children: <Widget>[
                  //TODO сделать добавление запчастей
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Расход запчастей и их стоимость', //TODO generate 18
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            isVisible = true;
                          });
                          //TODO add form for entry
                        },
                      ),
                    ],
                  ),
                  Consumer<PartsCart>(
                    builder: (context, partsCart, child) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              Provider.of<PartsCart>(context, listen: false)
                                  .partsCart
                                  .length,
                          itemBuilder: (BuildContext context, int index) => Row(
                                children: <Widget>[
                                  Expanded(child: Text(partsCart.partsCart[index].partName)),
                                  Text(partsCart.partsCart[index].partPrice.toString()),
                                ],
                              ));
                    },
                  ),
                  Divider(),
                  isVisible
                      ? Consumer<Parts>(
                          builder: (context, partsList, child) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: partsList.parts.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                          partsList.parts[index].partName)),
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (numberOfPart > 0) {
                                          numberOfPart--;
                                        }
                                      });
                                    },
                                  ),
                                  Text(numberOfPart.toString()),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      Provider.of<PartsCart>(context,
                                              listen: false)
                                          .add(partsList.parts[index]);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Container(),
                  Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String value) => entryNote = value,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: S.of(context).form_decorator_notes,
                ),
              ),
            ),
            Container(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 120,
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
                SizedBox(
                  width: 120,
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

  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    assert(initialDate != null);
    print(initialDate.toString());
    initialDate = (initialDate.year >= 2015 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    );
    if (result == null) return;

    setState(() {
      _controller.text = DateFormat('dd.MM.yyyy').format(result);
    });
  }

  DateTime convertToDate(String input) {
    try {
      var d = DateFormat('dd.MM.yyyy').parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  void _submitDetails() async {
    final FormState formState = _formKey.currentState;

    if (!formState.validate()) {
      //     showSnackBarMessage(S.of(context).form_warning_fill_info);
    } else {
      formState.save();
      final filtrRes =
          _maintenances.where((f) => f.maintenanceId == maintenanceId).first;
      entryName = filtrRes.maintenanceName;
      final entryId = _model.entryId;
      final _result = EntryModel(
        entryId: entryId,
        maintenanceId: maintenanceId,
        entryName: entryName,
        entryDateTime: entryDateTime,
        entryMileage: entryMileage,
        entryWorkPrice: entryWorkPrice,
        entryNote: entryNote,
      );
      final String _carId =
          Provider.of<CurrentCar>(context, listen: false).currentCar.carId;

      Provider.of<Entries>(context, listen: false).add(_carId, _result);

      Navigator.pushReplacementNamed(context, 'load_data_page');
    }
  }
}
