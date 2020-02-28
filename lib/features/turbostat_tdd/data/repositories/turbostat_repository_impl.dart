import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/core/error/exception.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/mode/mode_info.dart';
import 'package:turbostat_tdd/core/network/network_info.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/datasourses/local_data_source.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';
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
  Future<void> deleteCarModel(String carKey) async {
    if (await modeInfo.isCloudMode) {
      //   await remoteDataSource.addCarModel(carModel);
    } else {
      await localDataSource.deleteCarModel(carKey);
    }
  }

  @override
  Future<void> addMaintenanceModel(MaintenanceModel model, String carId) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      await localDataSource.addMaintenanceModel(model, carId);
    }
  }

  @override
  Future<Either<Failure, List<MaintenanceModel>>> getCarMaintenancies(
      String carId) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        final allLocalMaintenances =
            await localDataSource.getCarMaintenancies(carId);
        return Right(allLocalMaintenances);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return null;
  }

  @override
  Future<void> deleteMaintenance(String maintenanceId, String carId) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        await localDataSource.deleteMaintenance(maintenanceId, carId);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, MaintenanceModel>> getConcreteMaintenance(
      String carId, String maintenanceId) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        final allLocalMaintenances =
            await localDataSource.concreteMaintenance(carId, maintenanceId);
        return Right(allLocalMaintenances);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return null;
  }

  @override
  Future<void> addEntryModel(String carId, EntryModel model) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        await localDataSource.addEntry(carId, model);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<EntryModel>>> getEntries(
      String carId, String maintenanceId) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        final result = await localDataSource.getEntries(carId, maintenanceId);
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return null;
  }

  @override
  Future<void> deleteEntry(String carId, String entryId) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        await localDataSource.deleteEntry(carId, entryId);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<EntryModel>>> getAllEntries(String carId) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        final result = await localDataSource.getAllEntries(carId);
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return null;
  }

  @override
  Future<void> addPartModel(String carId, PartModel model) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        await localDataSource.addPart(carId, model);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<void> deletePartModel(String carId, PartModel model) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        await localDataSource.deletePart(carId, model);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PartModel>>> getAllPartModels(
      String carId) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        final result = await localDataSource.getAllParts(carId);
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return null;
  }

  @override
  Future<void> addEntryParts(String entryId, List<PartModel> partsList) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        await localDataSource.addEntryParts(entryId, partsList);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PartModel>>> getEntryParts(String entryId) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        final result = await localDataSource.getEntryParts(entryId);
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return null;
  }

  @override
  Future<void> addCarMileage(String carId, MileageModel mileage) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        await localDataSource.addCarMileage(carId, mileage);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, MileageModel>> getLastMileageModel(String carId) async {
    if (await modeInfo.isCloudMode) {
      // TODO add implementation
    } else {
      try {
        final result = await localDataSource.getLastMileageMode(carId);
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
    return null;
  }
}
