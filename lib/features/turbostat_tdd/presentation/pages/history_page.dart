import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_tdd/core/error/exception.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/providers/entries.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: _getData(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Consumer<Entries>(
            builder: (context, entry, child) {
              return ListView.builder(
                itemCount: entry.entries.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.cyan,
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Text(entry.entries[index].entryName != null
                            ? entry.entries[index].entryName
                            : 'unknowing entry'),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
//                                Navigator.pushReplacementNamed(context, 'edit_car');
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline),
                        onPressed: () async {},
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  _getData(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('carId');
    if (jsonString != null) {
      Map res = jsonDecode(pref.getString('carId'));
      final _car = CarModel.fromJson(res);
      Provider.of<Entries>(context, listen: false).updateAll(_car.carId);
    } else {
      throw CacheException();
    }
  }
}
