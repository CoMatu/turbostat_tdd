import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class AddPartModel {
    final TurbostatRepository repository;

  AddPartModel({@required this.repository});

  Future<void> addPartModel(String carId, PartModel model) async {
    await repository.addPartModel(carId, model);
  }

}