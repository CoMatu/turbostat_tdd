import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

class CarPageModel extends ChangeNotifier {
  final List<CarModel> _list = [];

  UnmodifiableListView<CarModel> get allCarModels => UnmodifiableListView(_list);

  void addCarModel(CarModel carModel) {
    _list.add(carModel);

    notifyListeners();
}

}