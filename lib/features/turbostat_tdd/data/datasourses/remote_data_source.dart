import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

abstract class TurbostatRemoteDataSource {

  Future<CarModel> getConcreteCarModel(String carId);

  Future<List<CarModel>> getAllCarModels(String userId);

}