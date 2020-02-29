import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  TurbostatLocalDataSourceImpl dataSource;

  final List<CarModel> tAllCarModels = [
    CarModel(
      carId: '1ss',
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
      carId: '2ss',
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

  final tEntry = EntryModel(
    entryId: '1',
    maintenanceId: '1',
    entryName: 'name1',
    entryDateTime: DateTime(2019, 07, 22, 00, 00),
    entryMileage: 80000,
    entryWorkPrice: 200.00,
    entryNote: 'entry note',
  );

  final tCarModel = CarModel(
    carId: '1dd',
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

  final tCarMileage = MileageModel(
    mileage: 88128,
    mileageDateTime: DateTime(2020, 1, 1),
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
      for (int i = 0; i < tAllCarModels.length; i++) {
        await dataSource.addCarModel(tAllCarModels[i]);
      }

      final result = await dataSource.getLastCarModels();
      expect(result, tAllCarModels);
    });

    test('should add CarModel to Local Data Source', () async {
      await dataSource.addCarModel(tCarModel);
      final result = await dataSource.getConcreteCarModel(tCarModel.carId);
      expect(result, tCarModel);
    });
    test('should add Mileage to Local Data Source', () async {
      await dataSource.addCarMileage(tCarModel.carId, tCarMileage);
      final result = await dataSource.getLastMileageMode(tCarModel.carId);
      expect(result, tCarMileage);
    });

    test('should add EntryModel to Local Data Source', () async {
      await dataSource.addEntry(
        tCarModel.carId,
        tEntry,
      );
      final result = await dataSource.getEntries(tCarModel.carId, tEntry.maintenanceId);
      final _entry = result.first;
      expect(_entry, tEntry);
    });
  });
}
