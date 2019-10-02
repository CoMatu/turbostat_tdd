import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class MockTurbostatLocalDataSource extends Mock
    implements TurbostatLocalDataSourceImpl {}

void main() async {
  TurbostatLocalDataSourceImpl dataSource;
  MockTurbostatLocalDataSource mockTurbostatLocalDataSource;



  final tAllCarModels = [
    CarModel(
        carId: '1',
        carName: 'car 1',
        carMark: 'nissan',
        carModel: 'note',
        carYear: 2012,
        carMileage: 83300,
        carVin: 'VIN123'),
    CarModel(
        carId: '2',
        carName: 'car 2',
        carMark: 'nissan',
        carModel: 'murano',
        carYear: 2017,
        carMileage: 8100,
        carVin: 'VIN321'),
  ];

  setUp(() async{
          final appDocumentDirPath =
        "/data/user/0/com.example.turbostat_tdd/app_flutter";
    Hive.init(appDocumentDirPath);

    mockTurbostatLocalDataSource = mockTurbostatLocalDataSource;
    dataSource = TurbostatLocalDataSourceImpl();
  });

  test('should return LastCarModels from local DataBase', () async {
    when(mockTurbostatLocalDataSource.getLastCarModels())
        .thenAnswer((_) async => tAllCarModels);
    final result = await dataSource.getLastCarModels();
    expect(result, Right(tAllCarModels));
  });
}
