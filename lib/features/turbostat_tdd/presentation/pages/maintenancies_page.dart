import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';

class MaintenanciesPage extends StatelessWidget {
  const MaintenanciesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MainAppBar(),
        body: Placeholder(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'add_maintenance');
          },
        ),
      ),
    );
  }
}
