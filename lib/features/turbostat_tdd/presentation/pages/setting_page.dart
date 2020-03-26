import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_tdd/generated/i18n.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.build),
            ),
            title: Text(S.of(context).maintenance_list),
            onTap: () async {
              final carId = Provider.of<CurrentCar>(context, listen: false)
                  .currentCar
                  .carId;
              await Provider.of<Maintenances>(context, listen: false)
                  .getAllMaintenances(carId);
              Navigator.pushNamed(context, 'maintenancies_page');
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.assignment),
            ),
            title: Text(S.of(context).parts_list),
            onTap: () async {
              final carId = Provider.of<CurrentCar>(context, listen: false)
                  .currentCar
                  .carId;
              await Provider.of<Maintenances>(context, listen: false)
                  .getAllMaintenances(carId);
              Navigator.pushNamed(context, 'parts_page');
            },
          )
        ],
      ),
    );
  }
}
