import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class DeleteMaintenance {
  final TurbostatRepository repository;

  DeleteMaintenance({@required this.repository});

  Future<void> deleteMaintenance(String maintenanceId, String carId) async {
    await repository.deleteMaintenance(maintenanceId, carId);
  }
}
