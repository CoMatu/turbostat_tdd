import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/usecases/usecase.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class GetCarMileage implements UseCase<int, Params>{
  final TurbostatRepository repository;

  GetCarMileage({@required this.repository});

  @override
  Future<Either<Failure, int>> call(Params params) {
    // TODO: implement call
    throw UnimplementedError();
  }


  }

  class Params extends Equatable {
  final String carId;

  Params({@required this.carId});

  @override
  List<Object> get props => [carId];  
}