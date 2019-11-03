import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';

class SelectDataSourcePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Выберите вариант размещения Ваших данных'),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ваше устройство:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
                'Ваши данные будут храниться в памяти телефона (планшета). Доступно на одном устройстве. Регистрация не нужна.'),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.system_update),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Ваше устройство',
                      ),
                    ),
                  ],
                ),
                onPressed: () async { //TODO extract method
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('data_source', 'device');
                  Navigator.of(context).pushReplacementNamed('load_data_page');
                },
                color: Colors.yellow,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Облачное хранилище:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ),
            Text(
              'Ваши данные будут храниться на защищенном сервере Google. Можно использовать на разных устройствах. Необходимо будет зарегистрировать аккаунт или войти с использованием аккаунта Google.',
              style: TextStyle(color: Colors.grey[400]),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.warning,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Функционал в разработке'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: RaisedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.cloud_queue, color: Colors.grey[400],),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        'Облачное хранилище',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                  ],
                ),
                onPressed: () async {
/*
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('data_source', 'cloud');
                  Navigator.of(context).pushReplacementNamed('start_page');
*/
                },
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
