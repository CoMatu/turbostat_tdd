import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';

class MaintenancesPage extends StatefulWidget {
  const MaintenancesPage({Key key}) : super(key: key);

  @override
  _MaintenancesPageState createState() => _MaintenancesPageState();
}

class _MaintenancesPageState extends State<MaintenancesPage> {
  List<MaintenanceModel> maintenancesList;

  @override
  void didChangeDependencies() {
    maintenancesList = Provider.of<Maintenances>(context).maintenances;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MainAppBar(),
        body: buildMaintenancesList(context),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'add_maintenance');
          },
        ),
      ),
    );
  }

  Widget buildMaintenancesList(BuildContext context) => Container(
        child: ListView.builder(
          itemCount: Provider.of<Maintenances>(context).maintenances.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(maintenancesList[index].maintenanceName),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () {},
                  ),
                ],
              ),
            );
          },
        ),
      );
}
