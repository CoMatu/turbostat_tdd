import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/usecases/usecase.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car_info.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/car_info_repository.dart';

class GetCarInfoList implements UseCase<List<CarInfo>, Params>{
  final CarInfoRepository repository;

  GetCarInfoList(this.repository);

  @override
  Future<Either<Failure, List<CarInfo>>> call(Params params) async {
    return await repository.getCarsInfoList(params.userId);
  }
}

class Params extends Equatable {
  final String userId;

  Params({@required this.userId}) : super([userId]);
}