import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class AddEntryParts {
  final TurbostatRepository repository;

  AddEntryParts({@required this.repository});

  Future<void> addEntryParts(String entryId, List<PartModel> partsList) async {
    await repository.addEntryParts(entryId, partsList);
  }
}
