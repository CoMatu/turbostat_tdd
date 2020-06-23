import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class DeleteCarModel {
  final TurbostatRepository repository;

  DeleteCarModel({@required this.repository});

  Future<void> deleteCarModel(String carKey) async {
    await repository.deleteCarModel(carKey);
  }
}
