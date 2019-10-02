import 'package:hive/hive.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

abstract class TurbostatLocalDataSource {
  Future<CarModel> getConcreteCarModel(String carId);

  Future<List<CarModel>> getLastCarModels();

  Future<void> cacheListCarModels(List<CarModel> listCarModelsToCache);
}

class TurbostatLocalDataSourceImpl implements TurbostatLocalDataSource {
  @override
  Future<void> cacheListCarModels(List<CarModel> listCarModelsToCache) {
    // TODO: implement cacheListCarModels
    return null;
  }

  @override
  Future<CarModel> getConcreteCarModel(String carId) {
    // TODO: implement getConcreteCarModel
    return null;
  }

  @override
  Future<List<CarModel>> getLastCarModels() async {
    final carsBox = await Hive.openBox('cars');
    final lastCarModels = carsBox.get(0);
    print(lastCarModels);
    // TODO: implement getLastCarModels
    return lastCarModels;
  }
}
