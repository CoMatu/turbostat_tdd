import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Placeholder(
            fallbackHeight: 80,
          ),
          Placeholder(
            fallbackHeight: 200,
          ),
          Placeholder(),
        ],
      ),
    );
  }
}
