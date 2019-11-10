import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentCar extends ChangeNotifier {
  String _carId;
  SharedPreferences pref;

  getCurrentCar() async {
    pref = await SharedPreferences.getInstance();
    _carId = pref.getString('carId');
    return _carId;
  }

  String get currentCarId => getCurrentCar();

  void updateCurrentCar(String carId) {
    _carId = carId;
    notifyListeners();
  }
}
