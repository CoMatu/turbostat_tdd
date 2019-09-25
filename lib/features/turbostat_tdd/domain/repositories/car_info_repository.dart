import 'package:dartz/dartz.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car_info.dart';

abstract class CarInfoRepository {
  Future<Either<Failure, List<CarInfo>>> getCarsInfoList(String userId);

}