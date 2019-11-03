
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:meta/meta.dart';

abstract class TurbostatRemoteDataSource {
  Future<CarModel> getConcreteCarModel(String carId);

  Future<List<CarModel>> getAllCarModels();
}

class TurbostatRemoteDataSourceImpl implements TurbostatRemoteDataSource {
  final CollectionReference collectionReference;

  TurbostatRemoteDataSourceImpl({@required this.collectionReference});
  @override
  Future<List<CarModel>> getAllCarModels() async {
    List<CarModel> list = [];

    String userId = 'test';

    final result = await collectionReference
        .where('userId', isEqualTo: userId)
        .getDocuments();

    result.documents.forEach((f) {
      CarModel res = CarModel.fromJson(f.data);
      list.add(res);
    });

    return list;
  }

  @override
  Future<CarModel> getConcreteCarModel(String carId) {
    return null;
  }
}
