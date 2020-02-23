import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';

class MaintenanceDetailsPage extends StatefulWidget {
  const MaintenanceDetailsPage({Key key}) : super(key: key);

  @override
  _MaintenanceDetailsPageState createState() => _MaintenanceDetailsPageState();
}

class _MaintenanceDetailsPageState extends State<MaintenanceDetailsPage> {
  double totalPrice = 0;

  @override
  void initState() {
    final partsList = Provider.of<Parts>(context, listen: false).parts;
    for(int i = 0; i < partsList.length; i++) {
       totalPrice = partsList[i].partPrice + totalPrice;
    }
    super.initState();
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
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: Text('Set reminder'),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: Text('Список запасных частей:'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: Consumer<Parts>(
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
                          itemCount: partsList.parts.length,
                          itemBuilder: (BuildContext context, int index) => Row(
                            children: <Widget>[
                              Expanded(
                                  child: Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child:
                                        Text(partsList.parts[index].partName),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Part code: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline,
                                      ),
                                      Text(
                                        partsList.parts[index].partCode,
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline,
                                      ),
                                    ],
                                  )
                                ],
                              )),
                              Text(partsList.parts[index].partPrice.toString()),
                              //  Text(numberOfPart.toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: Row(
                children: <Widget>[
                  Text('Total amount: '),
                  Text(totalPrice.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
