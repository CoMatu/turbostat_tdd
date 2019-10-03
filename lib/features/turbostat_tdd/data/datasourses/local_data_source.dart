import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

abstract class TurbostatLocalDataSource {
  Future<Either<Failure, CarModel>> getConcreteCarModel(String carId);

  Future<Either<Failure, List<CarModel>>> getLastCarModels();

  Future<void> cacheListCarModels(List<CarModel> listCarModelsToCache);
}

class TurbostatLocalDataSourceImpl implements TurbostatLocalDataSource {
  @override
  Future<void> cacheListCarModels(List<CarModel> listCarModelsToCache) {
    // TODO: implement cacheListCarModels
    return null;
  }

  @override
  Future<Either<Failure, CarModel>> getConcreteCarModel(String carId) {
    // TODO: implement getConcreteCarModel
    return null;
  }

  @override
  Future<Either<Failure, List<CarModel>>> getLastCarModels() async {
    List<CarModel> carsFromDataBase = [];
    final carsBox = await Hive.openBox('cars');
    var ind = carsBox.length;
    for (int i = 0; i < ind; i++) {
      carsFromDataBase.add(CarModel.fromJson(carsBox.get(i)));
    }
    print('runtime type:');
    print(Right(carsFromDataBase).runtimeType);
    return Right(carsFromDataBase);
  }
}
