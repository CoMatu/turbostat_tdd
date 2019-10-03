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
  Future<CarModel> getConcreteCarModel(String carId) async {
    List<CarModel> _carsFromDataBase = [];
    final carsBox = await Hive.openBox('cars');
    var ind = carsBox.length;
    for (int i = 0; i < ind; i++) {
      _carsFromDataBase.add(CarModel.fromJson(carsBox.get(i)));
    }
    final CarModel carModel = _carsFromDataBase.where((f) {
      if(f.carId == carId)
      return f;
    })
    return null;
  }

  @override
  Future<List<CarModel>> getLastCarModels() async {
    List<CarModel> carsFromDataBase = [];
    final carsBox = await Hive.openBox('cars');
    var ind = carsBox.length;
    for (int i = 0; i < ind; i++) {
      carsFromDataBase.add(CarModel.fromJson(carsBox.get(i)));
    }
    print('runtime type:');
    return carsFromDataBase;
  }
}
