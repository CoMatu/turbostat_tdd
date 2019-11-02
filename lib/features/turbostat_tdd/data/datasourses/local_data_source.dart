import 'package:hive/hive.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

abstract class TurbostatLocalDataSource {
  Future<CarModel> getConcreteCarModel(String carId);

  Future<List<CarModel>> getLastCarModels();

  Future<void> cacheListCarModels(List<CarModel> listCarModelsToCache);

  Future<void> addCarModel(CarModel carModel);
}

class TurbostatLocalDataSourceImpl implements TurbostatLocalDataSource {
  @override
  Future<void> cacheListCarModels(List<CarModel> listCarModelsToCache) async {
    final carsBox = await Hive.openBox('cars');
    listCarModelsToCache.forEach((f) => carsBox.add(f.toJson()));
  }

  @override
  Future<CarModel> getConcreteCarModel(String carId) async {
    List<CarModel> _carsFromDataBase = [];
    final carsBox = await Hive.openBox('cars');
    var ind = carsBox.length;
    for (int i = 0; i < ind; i++) {
      _carsFromDataBase.add(CarModel.fromJson(carsBox.get(i)));
    }
    final concreteCar = _carsFromDataBase.where((f) => f.carId == carId).first;
    return concreteCar;
  }

  @override
  Future<List<CarModel>> getLastCarModels() async {
    List<CarModel> carsFromDataBase = [];
    final carsBox = await Hive.openBox('cars');
    var ind = carsBox.length;
    for (int i = 0; i < ind; i++) {
      carsFromDataBase.add(CarModel.fromJson(carsBox.get(i)));
    }
    return carsFromDataBase;
  }

  @override
  Future<void> addCarModel(CarModel carModel) async {
    final carsBox = await Hive.openBox('cars');
    final carString = carModel.toJson();
    carsBox.add(carString);
  }
}
