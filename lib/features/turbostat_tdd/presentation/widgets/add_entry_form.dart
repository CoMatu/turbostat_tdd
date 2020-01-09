import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/core/fixtures/date_validator.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class AddEntryForm extends StatefulWidget {
  AddEntryForm({Key key}) : super(key: key);

  @override
  _AddEntryFormState createState() => _AddEntryFormState();
}

class _AddEntryFormState extends State<AddEntryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  List<MaintenanceModel> _maintenances;

  String entryId;
  String maintenanceId;
  String entryNote;
  DateTime entryDateTime;
  double entryWorkPrice;
  int entryMileage;

  @override
  void initState() {
    _maintenances =
        Provider.of<Maintenances>(context, listen: false).maintenances;
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
            ),
            Row(children: <Widget>[
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                  //                        icon: const Icon(Icons.calendar_today),
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
                initialValue: '',
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
                initialValue: '',
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
                          S.of(context).form_decorator_value_parts,
                          style: Theme.of(context).textTheme.subhead,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          //TODO add form for entry
                        },
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) =>
                        Text('test 1'),
                  ),
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

  void _submitDetails() async {
    final FormState formState = _formKey.currentState;

    if (!formState.validate()) {
      //     showSnackBarMessage(S.of(context).form_warning_fill_info);
    } else {
      formState.save();
      Navigator.pushReplacementNamed(context, 'load_data_page');
    }
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
}