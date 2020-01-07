import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_concrete_maintenance.dart';
import 'package:turbostat_tdd/injection_container.dart';

class CurrentMaintenance extends ChangeNotifier {
  MaintenanceModel _maintenance;

  MaintenanceModel get currentMaintenance => _maintenance;

  void update(String carId, String maintenanceId) async {
    final model = await sl<GetConcreteMaintenance>()
        .call(Params(carId: carId, maintenanceId: maintenanceId));

    _maintenance = model.fold(
      (failure) => null,
      (model) => model,
    );
  }
}
