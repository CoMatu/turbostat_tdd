import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_tdd/core/error/exception.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

class CurrentCar extends ChangeNotifier {
  CarModel _car;
  SharedPreferences pref;

  CarModel get currentCar => _car;

  void updateCurrentCar(CarModel car) {
    _car = car;
    notifyListeners();
  }

  Future<void> loadCarId() async {
    pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('carId');
    if (jsonString != null) {
      Map res = jsonDecode(pref.getString('carId'));
      _car = CarModel.fromJson(res);
      updateCurrentCar(_car);
    } else {
      throw CacheException();
    }
  }
}
