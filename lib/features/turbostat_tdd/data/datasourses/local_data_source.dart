import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:meta/meta.dart';

abstract class TurbostatLocalDataSource {
  Future<CarModel> getConcreteCarModel(String carId);

  Future<List<CarModel>> getLastCarModels();

  Future<void> cacheListCarModels(List<CarModel> listCarModelsToCache);
}

class TurbostatLocalDataSourceImpl implements TurbostatLocalDataSource {
  final SharedPreferences sharedPreferences;

  TurbostatLocalDataSourceImpl({@required this.sharedPreferences});

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
  Future<List<CarModel>> getLastCarModels() {
    // TODO: implement getLastCarModels
    return null;
  }
}
