import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_info.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, List<CarInfo>>> call(Params params);
}

class NoParams extends Equatable {}