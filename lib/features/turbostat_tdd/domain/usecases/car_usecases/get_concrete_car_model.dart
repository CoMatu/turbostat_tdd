import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/usecases/usecase.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class GetConcreteCarModel implements UseCase<CarModel, Params> {
  final TurbostatRepository repository;

  GetConcreteCarModel({@required this.repository});

  @override
  Future<Either<Failure, CarModel>> call(Params params) async {
    return await repository.getConcreteCarModel(params.carId);
  }

}

class Params extends Equatable {
  final String carId;

  Params({@required this.carId});

  @override
  List<Object> get props => [carId];  
}