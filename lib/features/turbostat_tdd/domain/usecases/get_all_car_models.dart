import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/usecases/usecase.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class GetAllCarModels implements UseCase<List<CarModel>, Params> {
  final TurbostatRepository repository;

  GetAllCarModels({@required this.repository});

  @override
  Future<Either<Failure, List<CarModel>>> call(Params params) async {
    return await repository.getAllCarModels(params.userId);
  }

}

class Params extends Equatable {
  final String userId;

  Params({@required this.userId});

  @override
  List<Object> get props => [userId];  
}