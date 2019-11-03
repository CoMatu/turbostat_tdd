import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/remote_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

class MockDocumentReference extends Mock implements DocumentReference {}

class MockFirestore extends Mock implements Firestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class MockQuery extends Mock implements Query {}

void main() {
  Firestore mockFirestore;
  TurbostatRemoteDataSourceImpl remoteDataSource;
  CollectionReference mockRef;

  //final String userId = '-LjyAjQ_1FvhXW6UAqAd';
    final List<CarModel> tAllCarModels = [
    CarModel(
      carId: '1',
      carName: 'car 1',
      carMark: 'nissan',
      carModel: 'note',
      carYear: 2012,
      carVin: 'VIN123',
      licencePlate: 'f333',
      fuelType: 'liquid',
      tankVolume: 38,
      carNote: 'car note',
    ),
    CarModel(
      carId: '2',
      carName: 'car 2',
      carMark: 'nissan',
      carModel: 'murano',
      carYear: 2017,
      carVin: 'VIN321',
      licencePlate: 'f333',
      fuelType: 'liquid',
      tankVolume: 38,
      carNote: 'car note',
    ),
  ];


  setUpAll(() async {
    mockFirestore = MockFirestore();
    mockRef = MockCollectionReference();
    remoteDataSource = TurbostatRemoteDataSourceImpl(collectionReference: mockRef);
  });

  group('Collections and documents', () {
    test('should get all cars from firestore by userID', () async {
      when(remoteDataSource.getAllCarModels()).thenAnswer((_) async => tAllCarModels);

      mockFirestore.document(any); // for hide warning

      final result = await remoteDataSource.getAllCarModels();

      expect(result, equals(tAllCarModels));
    });
  });
}
