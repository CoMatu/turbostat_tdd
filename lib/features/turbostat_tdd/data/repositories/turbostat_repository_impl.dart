import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/core/error/exception.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/network/network_info.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/remote_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class TurbostatRepositoryImpl implements TurbostatRepository {
  final TurbostatRemoteDataSource remoteDataSource;
  final TurbostatLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TurbostatRepositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, List<CarModel>>> getAllCarModels(String userId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteAllCarModels =
            await remoteDataSource.getAllCarModels(userId);
        localDataSource.cacheListCarModels(remoteAllCarModels);
        return Right(remoteAllCarModels);
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
  }

  @override
  Future<Either<Failure, CarModel>> getConcreteCarModel(String carId) async {
    networkInfo.isConnected;
    try {
      final remoteCarModel = await remoteDataSource.getConcreteCarModel(carId);
      return Right(remoteCarModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
