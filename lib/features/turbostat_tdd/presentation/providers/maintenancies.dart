import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/maint_usecases/add_maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/maint_usecases/get_all_maintenances.dart';
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
        (failure) => [], (allMaintenancesList) => allMaintenancesList));

    if (_maintenances.isEmpty) {
      String dataFromFile =
          await rootBundle.loadString('res/data/maintenances_db.json');
      final result = jsonDecode(dataFromFile);
      final List<MaintenanceModel> maintPreloaded = result
          .map<MaintenanceModel>((m) => MaintenanceModel.fromJson(m))
          .toList();
      _maintenances.addAll(maintPreloaded);
      for(MaintenanceModel model in _maintenances) {
        await sl<AddMaintenanceModel>().addMaintenanceModel(model, carId);
      }
    }

    notifyListeners();
  }

  void add(MaintenanceModel model, String carId) async {
    await sl<AddMaintenanceModel>().addMaintenanceModel(model, carId);
    _maintenances.add(model);
    notifyListeners();
  }
}
