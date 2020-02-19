import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';

class MaintenanceDetailsPage extends StatefulWidget {
  const MaintenanceDetailsPage({Key key}) : super(key: key);

  @override
  _MaintenanceDetailsPageState createState() => _MaintenanceDetailsPageState();
}

class _MaintenanceDetailsPageState extends State<MaintenanceDetailsPage> {
  double totalPrice;
  EntryModel model;
  MaintenanceModel _maintenanceModel;

  @override
  void initState() {
    totalPrice = Provider.of<PartsCart>(context, listen: false).totalPrice;
    final _listMaintenancies =
        Provider.of<Maintenances>(context, listen: false).maintenances;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    model = ModalRoute.of(context).settings.arguments;
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
                        child: Text('maintenance_name'),
                      ),
                    ],
                  )
                ],
              ),
              subtitle: Text('maintenance description'),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                  'До ближайшей операции ТО осталось ХХХ дней или 00000 км'),
            ),
            Text('Set reminder'),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text('Список запасных частей:'),
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
