import 'package:flutter/material.dart';

// TODO потом решить использовать или нет

class BottomController extends StatelessWidget {
  const BottomController({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        color: Theme.of(context).primaryColorLight,
        height: 56,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.view_list),
                  Text('History'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.pie_chart),
                  Text('Stats'),
                ],
              ),
              SizedBox(width: 50,),
              Column(
                children: <Widget>[
                  Icon(Icons.directions_car),
                  Text('Cars'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.settings),
                  Text('Setting'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
