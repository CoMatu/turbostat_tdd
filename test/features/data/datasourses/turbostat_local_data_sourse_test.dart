import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';

void main() async {
  TurbostatLocalDataSourceImpl dataSource;

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

  final List<EntryModel> tAllEntryModels = [
    EntryModel(
      entryId: '1',
      maintenanceId: '1',
      entryName: 'name1',
      entryDateTime: DateTime(2019, 07, 22, 00, 00),
      entryMileage: 80000,
      entryWorkPrice: 200.00,
      entryNote: 'entry note',
    ),
    EntryModel(
      entryId: '2',
      maintenanceId: '2',
      entryName: 'name2',
      entryDateTime: DateTime(2019, 11, 15, 00, 00),
      entryMileage: 55000,
      entryWorkPrice: 500.00,
      entryNote: 'entry note',
    ),
  ];

  final tCarModel = CarModel(
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
  );

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
      final testEntryBox = await Hive.openBox('entries_$tCarId');
      tAllEntryModels.forEach((r) {
        testEntryBox.add(r.toJson());
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

    test('should return AllEntries from localDataSource', () async {
      final result = await dataSource.getAllEntries(tCarId);
      expect(result, tAllEntryModels);
    });
  });

  group('cache data to local database', () {
    test('should cache all CarModels to Local Data Source', () async {
      await dataSource.cacheListCarModels(tAllCarModels);
      final result = await dataSource.getLastCarModels();
      expect(result, tAllCarModels);
    });

    test('should add CarModel to Local Data Source', () async {
      await dataSource.addCarModel(tCarModel);
      final result = await dataSource.getConcreteCarModel(tCarModel.carId);
      expect(result, tCarModel);
    });
  });
}
