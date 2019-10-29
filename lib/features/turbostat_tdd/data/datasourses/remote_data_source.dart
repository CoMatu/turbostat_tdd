import 'package:cloud_firestore/cloud_firestore.dart' as fs;
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:meta/meta.dart';

abstract class TurbostatRemoteDataSource {

  Future<CarModel> getConcreteCarModel(String carId);

  Future<List<CarModel>> getAllCarModels(String userId);

}

class TurbostatRemoteDataSourceImpl implements TurbostatRemoteDataSource {
  final fs.Firestore firestore;

  TurbostatRemoteDataSourceImpl({@required this.firestore});
  @override
  Future<List<CarModel>> getAllCarModels(String userId) async {
    final res = firestore.collection(userId);
    
    return null;
  }

  @override
  Future<CarModel> getConcreteCarModel(String carId) {
    // TODO: implement getConcreteCarModel
    return null;
  }
  
}