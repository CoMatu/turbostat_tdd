import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';

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

  setUpAll(() async {
    final appDocumentDirPath = await Directory.systemTemp.createTemp();
    Hive.init(appDocumentDirPath.path);

    // Mock out the MethodChannel for the path_provider plugin.
    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      // If you're getting the apps documents directory, return the path to the
      // temp directory on the test environment instead.
      if (methodCall.method == 'getApplicationDocumentsDirectory') {
        return appDocumentDirPath.path;
      }
      return null;
    });

    mockTurbostatLocalDataSource = MockTurbostatLocalDataSource();
    dataSource = TurbostatLocalDataSourceImpl();
    final testBox = await Hive.openBox('cars');
    testBox.add('test 1');
  });

  test('should return LastCarModels from local DataBase', () async {
    when(mockTurbostatLocalDataSource.getLastCarModels())
        .thenAnswer((_) async => tAllCarModels);
    final result = await dataSource.getLastCarModels();
    expect(result, Right(tAllCarModels));
  });
}
