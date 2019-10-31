import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:meta/meta.dart';

abstract class TurbostatRemoteDataSource {
  Future<CarModel> getConcreteCarModel(String carId);

  Future<List<CarModel>> getAllCarModels(String userId);
}

class TurbostatRemoteDataSourceImpl implements TurbostatRemoteDataSource {
  final CollectionReference collectionReference;

  TurbostatRemoteDataSourceImpl({@required this.collectionReference});
  @override
  Future<List<CarModel>> getAllCarModels(String userId) async {
    final result =
        collectionReference.where('userId', isEqualTo: userId).getDocuments();
    return null;
  }

  @override
  Future<CarModel> getConcreteCarModel(String carId) {
    return null;
  }
}
