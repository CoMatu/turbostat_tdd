import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_tdd/core/error/exception.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/mode/mode_info.dart';
import 'package:turbostat_tdd/core/network/network_info.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/remote_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/repositories/turbostat_repository_impl.dart';

class MockLocalDataSource extends Mock implements TurbostatLocalDataSource {}

class MockRemoteDataSourse extends Mock implements TurbostatRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockModeInfo extends Mock implements ModeInfo {}

main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  TurbostatRepositoryImpl repository;
  MockRemoteDataSourse mockRemoteDataSourse;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;
  MockModeInfo mockModeInfo;

  WidgetsFlutterBinding.ensureInitialized(); 

  setUp(() {
    mockRemoteDataSourse = MockRemoteDataSourse();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockModeInfo = MockModeInfo();

    repository = TurbostatRepositoryImpl(
      //  remoteDataSource: mockRemoteDataSourse,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
      modeInfo: mockModeInfo,
    );
  });

  setUpAll(() async {
    const MethodChannel('plugins.flutter.io/shared_preferences')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{
          "flutter.data_source": "device", // without flutter. test don't work
        }; // set initial values here if desired
      }
      return null;
    });
    await SharedPreferences.getInstance();
  });

  group('getAllCarModels', () {
    // final tUserId = 'matu1';
    final tAllCarModels = [
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

    test('should check if the device is online', () {
      //arrange
      when(mockModeInfo.isCloudMode).thenAnswer((_) async => true);
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getAllCarModels();
      // assert
      verify(mockModeInfo.isCloudMode);
    });

    group('device is online', () {
      setUp(() {
        when(mockModeInfo.isCloudMode).thenAnswer((_) async => true);
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(mockRemoteDataSourse.getAllCarModels())
            .thenAnswer((_) async => tAllCarModels);
        final result = await repository.getAllCarModels();
        verify(mockRemoteDataSourse.getAllCarModels());
        expect(result, equals(Right(tAllCarModels)));
      });
      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSourse.getAllCarModels())
              .thenThrow(ServerException());
          // act
          final result = await repository.getAllCarModels();
          // assert
          verify(mockRemoteDataSourse.getAllCarModels());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );

      test(
          'should cache the data locally when the call to remote data source is successful',
          () async {
        when(mockRemoteDataSourse.getAllCarModels())
            .thenAnswer((_) async => tAllCarModels);

        await repository.getAllCarModels();

        verify(mockRemoteDataSourse.getAllCarModels());
        verify(mockLocalDataSource.cacheListCarModels(tAllCarModels));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockModeInfo.isCloudMode).thenAnswer((_) async => false);
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(mockLocalDataSource.getLastCarModels())
            .thenAnswer((_) async => tAllCarModels);

        final result = await repository.getAllCarModels();
        verifyZeroInteractions(mockRemoteDataSourse);
        verify(mockLocalDataSource.getLastCarModels());
        expect(result, equals(Right(tAllCarModels)));
      });
      test('should return CacheFailure when there is no cached data present',
          () async {
        when(mockLocalDataSource.getLastCarModels())
            .thenThrow(CacheException());
        final result = await repository.getAllCarModels();
        verifyZeroInteractions(mockRemoteDataSourse);
        verify(mockLocalDataSource.getLastCarModels());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });

  group('getConcreteCarModel', () {
    final tCarId = '1';
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

    test('should check if the device is online', () {
      //arrange
      when(mockModeInfo.isCloudMode).thenAnswer((_) async => true);
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getConcreteCarModel(tCarId);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockModeInfo.isCloudMode).thenAnswer((_) async => true);

        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(mockRemoteDataSourse.getConcreteCarModel(tCarId))
            .thenAnswer((_) async => tCarModel);
        final result = await repository.getConcreteCarModel(tCarId);
        verify(mockRemoteDataSourse.getConcreteCarModel(tCarId));
        expect(result, equals(Right(tCarModel)));
      });
      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSourse.getConcreteCarModel(tCarId))
              .thenThrow(ServerException());
          // act
          final result = await repository.getConcreteCarModel(tCarId);
          // assert
          verify(mockRemoteDataSourse.getConcreteCarModel(tCarId));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(mockModeInfo.isCloudMode).thenAnswer((_) async => false);
      });
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

      test('should return all entry model from local DataSource', () async {
        when(mockLocalDataSource.getAllEntries(tCarId))
            .thenAnswer((_) async => tAllEntryModels);
        final result = await repository.getAllEntries(tCarId);
        verifyZeroInteractions(mockRemoteDataSourse);
        verify(mockLocalDataSource.getAllEntries(tCarId));
        expect(result, equals(Right(tAllEntryModels)));
      });

      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(mockLocalDataSource.getConcreteCarModel(tCarId))
            .thenAnswer((_) async => tCarModel);

        final result = await repository.getConcreteCarModel(tCarId);
        verifyZeroInteractions(mockRemoteDataSourse);
        verify(mockLocalDataSource.getConcreteCarModel(tCarId));
        expect(result, equals(Right(tCarModel)));
      });
      test('should return CacheFailure when there is no cached data present',
          () async {
        when(mockLocalDataSource.getConcreteCarModel(tCarId))
            .thenThrow(CacheException());
        final result = await repository.getConcreteCarModel(tCarId);
        verifyZeroInteractions(mockRemoteDataSourse);
        verify(mockLocalDataSource.getConcreteCarModel(tCarId));
        expect(result, equals(Left(CacheFailure())));
      });

      test('should add CarModel to repository', () async {
        await mockLocalDataSource.addCarModel(tCarModel);
        verify(mockLocalDataSource.addCarModel(tCarModel)).called(1);
      });
    });
  });
}
