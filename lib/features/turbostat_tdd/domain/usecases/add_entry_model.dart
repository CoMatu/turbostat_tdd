import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class AddEntryModel {
    final TurbostatRepository repository;

  AddEntryModel({@required this.repository});

  Future<void> addEntryModel(String carId, EntryModel model) async {
    await repository.addEntryModel(carId, model);
  }

}