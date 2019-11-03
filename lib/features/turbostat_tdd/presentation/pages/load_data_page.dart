import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';

class LoadDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: Placeholder(),
          ),
          Expanded(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
