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
        body: buildPartsList(context),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
    //        Navigator.popAndPushNamed(context, 'add_maintenance');
          },
        ),
      ),
    );
  }

}

  buildPartsList(BuildContext context) {
    return Row(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.adjust),
          title: Text('data'),
          subtitle: Text('sub data'),
        ),
      ],
    );
  }

