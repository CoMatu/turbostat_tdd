import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_maintenances.dart';
import 'package:turbostat_tdd/injection_container.dart';

class Maintenances extends ChangeNotifier {
  final List<MaintenanceModel> _maintenances = [];

  UnmodifiableListView<MaintenanceModel> get maintenances {
    return UnmodifiableListView(_maintenances);
  }

  Future<void> getAllMaintenances(String carId) async {
    _maintenances.clear();
    final allMaintenancesList =
        await sl<GetAllMaintenances>().call(Params(carId: carId));
    _maintenances.addAll(allMaintenancesList.fold(
        (failure) => null, //TODO не уверен, что так правильно, но пока работает
        (allMaintenancesList) => allMaintenancesList));
  }

  void add(MaintenanceModel model, String carId) async {
    await sl<AddMaintenanceModel>().addMaintenanceModel(model, carId);
    _maintenances.add(model);
    notifyListeners();
  }
}
