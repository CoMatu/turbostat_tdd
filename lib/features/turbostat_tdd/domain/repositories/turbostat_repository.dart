import 'package:dartz/dartz.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

abstract class TurbostatRepository {
  Future<Either<Failure, CarModel>> getConcreteCarModel(String carId);
  Future<Either<Failure, List<CarModel>>> getAllCarModels();
  Future<void> addConcreteCarModel(CarModel carModel);
  Future<void> deleteCarModel(String carKey);
}