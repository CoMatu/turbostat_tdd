import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class DeletePartModel {
    final TurbostatRepository repository;

  DeletePartModel({@required this.repository});

  Future<void> deletePartModel(String carId, PartModel model) async {
    await repository.deletePartModel(carId, model);
  }

}