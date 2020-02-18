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

  @override
  void initState() {

    
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
              child: Text('До ближайшей операции ТО осталось ХХХ дней или 00000 км'),
            ),
            Text('Set reminder'),
            Divider(),
            Text('Список запасных частей:'),
            Consumer<Parts>(
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
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Text(partsList
                                                .parts[index].partName)),
                                        Text(partsList.parts[index].partPrice
                                            .toString()),
                                        //  Text(numberOfPart.toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )

          ],
        ),
      ),
    );
  }
}
