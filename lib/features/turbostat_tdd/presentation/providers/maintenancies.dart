import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_maintenance_model.dart';
import 'package:turbostat_tdd/injection_container.dart';

class Maintenances extends ChangeNotifier {
  final List<MaintenanceModel> _maintenances = [];

  UnmodifiableListView<MaintenanceModel> get maintenances =>
      UnmodifiableListView(_maintenances);
  
  void add(MaintenanceModel model, String carId) async {
    await sl<AddMaintenanceModel>().addMaintenanceModel(model, carId);
    _maintenances.add(model);
    notifyListeners();
  }
}
