import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class DeleteEntry {
  final TurbostatRepository repository;

  DeleteEntry({@required this.repository});

  Future<void> deleteEntry(String carId, String entryId) async {
    await repository.deleteEntry(carId, entryId);
  }
}
