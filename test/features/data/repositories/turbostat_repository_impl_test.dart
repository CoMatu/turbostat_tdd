import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:turbostat_tdd/core/error/exception.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/network/network_info.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/remote_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/repositories/turbostat_repository_impl.dart';

class MockLocalDataSource extends Mock implements TurbostatLocalDataSource {}

class MockRemoteDataSourse extends Mock implements TurbostatRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

main() {
  TurbostatRepositoryImpl repository;
  MockRemoteDataSourse mockRemoteDataSourse;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSourse = MockRemoteDataSourse();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TurbostatRepositoryImpl(
      remoteDataSource: mockRemoteDataSourse,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getAllCarModels', () {
    final tUserId = 'matu1';
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

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getAllCarModels(tUserId);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        when(mockRemoteDataSourse.getAllCarModels(tUserId))
            .thenAnswer((_) async => tAllCarModels);
        final result = await repository.getAllCarModels(tUserId);
        verify(mockRemoteDataSourse.getAllCarModels(tUserId));
        expect(result, equals(Right(tAllCarModels)));
      });
      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSourse.getAllCarModels(tUserId))
              .thenThrow(ServerException());
          // act
          final result = await repository.getAllCarModels(tUserId);
          // assert
          verify(mockRemoteDataSourse.getAllCarModels(tUserId));
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
          'should return last locally cached data when the cached data is present',
          () async {
        when(mockLocalDataSource.getLastCarModels())
            .thenAnswer((_) async => tAllCarModels);

        final result = await repository.getAllCarModels(tUserId);
        verifyZeroInteractions(mockRemoteDataSourse);
        verify(mockLocalDataSource.getLastCarModels());
        expect(result, equals(Right(tAllCarModels)));
      });
      test('should return CacheFailure when there is no cached data present',
          () async {
        when(mockLocalDataSource.getLastCarModels())
            .thenThrow(CacheException());
        final result = await repository.getAllCarModels(tUserId);
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
        carMileage: 83300,
        carVin: 'VIN123');

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getConcreteCarModel(tCarId);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
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
    });
  });
}
