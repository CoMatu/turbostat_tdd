import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/core/error/exception.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/mode/mode_info.dart';
import 'package:turbostat_tdd/core/network/network_info.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class TurbostatRepositoryImpl implements TurbostatRepository {
//  final TurbostatRemoteDataSource remoteDataSource;
  final TurbostatLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final ModeInfo modeInfo;

  TurbostatRepositoryImpl({
//    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
    @required this.modeInfo,
  });

  @override
  Future<Either<Failure, List<CarModel>>> getAllCarModels() async {
    if (await modeInfo.isCloudMode) {
      if (await networkInfo.isConnected) {
        try {
//          final remoteAllCarModels = await remoteDataSource.getAllCarModels();
//          localDataSource.cacheListCarModels(remoteAllCarModels);
//          return Right(remoteAllCarModels);
          return null;
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        try {
          final localCarModels = await localDataSource.getLastCarModels();
          return Right(localCarModels);
        } on CacheException {
          return Left(CacheFailure());
        }
      }
    } else {
      try {
        final localCarModels = await localDataSource.getLastCarModels();
        return Right(localCarModels);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CarModel>> getConcreteCarModel(String carId) async {
    if (await modeInfo.isCloudMode) {
      if (await networkInfo.isConnected) {
        try {
//          final remoteCarModel =
//              await remoteDataSource.getConcreteCarModel(carId);
//          return Right(remoteCarModel);
          return null;
        } on ServerException {
          return Left(ServerFailure());
        }
      } else {
        try {
          final localCarModel =
              await localDataSource.getConcreteCarModel(carId);
          return Right(localCarModel);
        } on CacheException {
          return Left(CacheFailure());
        }
      }
    } else {
      try {
        final localCarModel = await localDataSource.getConcreteCarModel(carId);
        return Right(localCarModel);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<void> addConcreteCarModel(CarModel carModel) async {
    if (await modeInfo.isCloudMode) {
      //   await remoteDataSource.addCarModel(carModel);
    } else {
      await localDataSource.addCarModel(carModel);
    }
  }

  @override
  Future<void> deleteCarModel(String carId) async {
    if (await modeInfo.isCloudMode) {
      //   await remoteDataSource.addCarModel(carModel);
    } else {
      await localDataSource.deleteCarModel(carId);
    }
  }
}
