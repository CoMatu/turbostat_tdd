import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class AddCarModel {
  final TurbostatRepository repository;

  AddCarModel({@required this.repository});

  Future<void> addCarModel(CarModel carModel) async {
    await repository.addConcreteCarModel(carModel);
  }

}