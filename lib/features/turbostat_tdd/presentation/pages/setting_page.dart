import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(),
            title: Text('Список операций технического обслуживания'),
            onTap: () {
                    Navigator.pushNamed(context, 'maintenancies_page');
            },
          )
        ],
      ),
    );
  }
}
