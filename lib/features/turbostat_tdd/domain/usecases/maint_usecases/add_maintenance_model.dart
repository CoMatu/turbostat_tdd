import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class AddMaintenanceModel {
  final TurbostatRepository repository;
  AddMaintenanceModel({@required this.repository});

  Future<void> addMaintenanceModel(MaintenanceModel model, String carId) async {
    await repository.addMaintenanceModel(model, carId);
  }
}
