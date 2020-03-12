import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/calculate_remainder.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'package:turbostat_tdd/generated/i18n.dart';
import 'package:turbostat_tdd/injection_container.dart';

class MaintenanceDetailsPage extends StatefulWidget {
  const MaintenanceDetailsPage({Key key}) : super(key: key);

  @override
  _MaintenanceDetailsPageState createState() => _MaintenanceDetailsPageState();
}

class _MaintenanceDetailsPageState extends State<MaintenanceDetailsPage> {
  double totalPrice;
  EntryModel model;
  MaintenanceModel _maintenanceModel;
  int daysLeft;
  int mileageLeft;
  String carId;

  @override
  void initState() {
    totalPrice = Provider.of<PartsCart>(context, listen: false).totalPrice;
    carId = Provider.of<CurrentCar>(context, listen: false).currentCar.carId;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    model = ModalRoute.of(context).settings.arguments;
    final _listMaintenancies =
        Provider.of<Maintenances>(context, listen: false).maintenances;
    _maintenanceModel = _listMaintenancies
        .singleWhere((element) => element.maintenanceId == model.maintenanceId);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MainAppBar(),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          model.entryName,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
              subtitle: Text(S.of(context).entry_details_page_description(
                    _maintenanceModel.maintenanceMonthLimit.toString(),
                    _maintenanceModel.maintenanceMileageLimit.toString(),
                  )),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: RemaindedTextWidget(_maintenanceModel, carId),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: RaisedButton(
                onPressed: () async {
                  int duration = _maintenanceModel.maintenanceMonthLimit * 30 -
                      DateTime.now().difference(model.entryDateTime).inDays;
                  final Event event = Event(
                    title: _maintenanceModel.maintenanceName,
                    description: S.of(context).entry_details_page_description(
                        _maintenanceModel.maintenanceMonthLimit.toString(),
                        _maintenanceModel.maintenanceMileageLimit.toString()),
                    startDate: DateTime.now().add(Duration(days: duration)),
                    endDate: DateTime.now().add(Duration(days: duration + 1)),
                  );
                  Add2Calendar.addEvent2Cal(event);
                },
                child: Text(S.of(context).button_add_calendar_camel),
                color: Theme.of(context).accentColor,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text('Список запасных частей:'), // TODO add i18n
                    alignment: Alignment.centerLeft,
                  ),
                  Consumer<PartsCart>(
                    builder: (context, partsList, child) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 12.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            // TODO добавить 18
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: partsList.partsCart.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                          partsList.partsCart[index].partName)),
                                  Text(partsList.partsCart[index].partPrice
                                      .toString()),
                                  //  Text(numberOfPart.toString()),
                                ],
                              ),
                            ),
                            Divider(),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child:
                                        Text('Amount: ')), // TODO add to i18n
                                Text(totalPrice.toString()),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Стоимость выполнения работ: '),
                      ),
                      Text(model.entryWorkPrice.toString()),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Total amount: '),
                      ),
                      Text((model.entryWorkPrice + totalPrice).toString()),
                    ],
                  ),
                  Container(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Notes: '),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(model.entryNote),
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
}

class RemaindedTextWidget extends StatelessWidget {
  final MaintenanceModel maintenanceModel;
  final String carId;
  const RemaindedTextWidget(
    this.maintenanceModel,
    this.carId, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRemainded(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Text(
                S.of(context).dashboard_page_maintenance_before(
                    snapshot.data[0].toString(), snapshot.data[1].toString()),
              );
            }
          }
          return Text(
            'data not aviable',
            style: Theme.of(context).textTheme.overline,
          );
        });
  }

  getRemainded() async {
    int mileageLeft = await sl<CalculateRemainder>()
        .getRemainderDistance(carId, maintenanceModel);
    int daysLeft = await sl<CalculateRemainder>()
        .getRemainderDays(carId, maintenanceModel);

    List<int> remaindedList = [daysLeft, mileageLeft];

    return remaindedList;
  }
}
