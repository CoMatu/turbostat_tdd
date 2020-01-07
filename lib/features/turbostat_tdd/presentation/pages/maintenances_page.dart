import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/delete_maintenance.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/pages/pages.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/current_maintenance.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

import '../../../../injection_container.dart';

class MaintenancesPage extends StatefulWidget {
  const MaintenancesPage({Key key}) : super(key: key);

  @override
  _MaintenancesPageState createState() => _MaintenancesPageState();
}

class _MaintenancesPageState extends State<MaintenancesPage> {
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
        child: Consumer<Maintenances>(
          builder: (context, maintenances, child) => ListView.builder(
            itemCount: maintenances.maintenances.length,
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
                            Text(maintenances
                                .maintenances[index].maintenanceName),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        final carId =
                            Provider.of<CurrentCar>(context, listen: false)
                                .currentCar
                                .carId;

                        Provider.of<CurrentMaintenance>(context, listen: false)
                            .update(carId,
                                maintenances.maintenances[index].maintenanceId);
                        Navigator.pushNamed(context, 'edit_maintenance');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () async {
                        final carId =
                            Provider.of<CurrentCar>(context, listen: false)
                                .currentCar
                                .carId;

                        final ConfirmAction confirmAction =
                            await asyncConfirmDialog(context);
                        if (confirmAction == ConfirmAction.ACCEPT) {
                          await sl<DeleteMaintenance>().deleteMaintenance(
                              maintenances.maintenances[index].maintenanceId,
                              carId);
                          Provider.of<Maintenances>(context, listen: false)
                              .getAllMaintenances(carId);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );

  Future<ConfirmAction> asyncConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).delete_entry_operation),
          content: Text(S.of(context).delete_entry_operation_warning),
          actions: <Widget>[
            FlatButton(
              child: Text(
                S.of(context).button_cancel,
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: Text(
                S.of(context).button_delete,
              ),
              onPressed: () async {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    );
  }
}
