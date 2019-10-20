import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';


void main() async {
  TurbostatLocalDataSourceImpl dataSource;

  final List<CarModel> tAllCarModels = [
    CarModel(
        carId: '1',
        carName: 'car 1',
        carMark: 'nissan',
        carModel: 'note',
        carYear: 2012,
        carVin: 'VIN123'),
    CarModel(
        carId: '2',
        carName: 'car 2',
        carMark: 'nissan',
        carModel: 'murano',
        carYear: 2017,
        carVin: 'VIN321'),
  ];

  final tCarModel = CarModel(
      carId: '1',
      carName: 'car 1',
      carMark: 'nissan',
      carModel: 'note',
      carYear: 2012,
      carVin: 'VIN123');

  final tCarId = '1';

  setUp(() async {
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

    dataSource = TurbostatLocalDataSourceImpl();
  });

  group('get data from localDataSource', () {
    setUp(() async {
      final testBox = await Hive.openBox('cars');
      tAllCarModels.forEach((r) {
        testBox.add(r.toJson());
      });
    });

    test('should return LastCarModels from local DataBase', () async {
      final result = await dataSource.getLastCarModels();
      expect(result, tAllCarModels);
    });

    test('should return concrete CarModel from local DataBase', () async {
      final result = await dataSource.getConcreteCarModel(tCarId);
      expect(result, tCarModel);
    });
  });

  group('cache data to local database', () {
    test('should cache all CarModels to Local Data Source', () async {
      await dataSource.cacheListCarModels(tAllCarModels);
      final result = await dataSource.getLastCarModels();
      expect(result, tAllCarModels);
    });
  });
}
