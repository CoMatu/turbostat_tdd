import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';

class MaintenancesPage extends StatelessWidget {
  const MaintenancesPage({Key key}) : super(key: key);

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
        return ListTile(
          leading: CircleAvatar(),
        );
      },
    ),
  );
}
