import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';

class CurrentMaintenance extends ChangeNotifier {
  MaintenanceModel _maintenance;

  MaintenanceModel get currentMaintenance => _maintenance;

  void update(MaintenanceModel maintenance) async {
    _maintenance = maintenance;
    notifyListeners();
  }
}
