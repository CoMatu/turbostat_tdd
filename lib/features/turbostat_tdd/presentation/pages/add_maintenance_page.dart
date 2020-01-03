import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';

class AddMaintenancePage extends StatelessWidget {
  const AddMaintenancePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: BottomNavigation(),
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
    child: AddMaintenanceForm(),
  );
  }
}