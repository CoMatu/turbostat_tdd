import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';

class PartsPage extends StatefulWidget {
  const PartsPage({Key key}) : super(key: key);

  @override
  _PartsPageState createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MainAppBar(),
        body: PartsList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.popAndPushNamed(context, 'add_part');
          },
        ),
      ),
    );
  }
}

//TODO список запчастей сортировка
