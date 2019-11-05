import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/usecases/usecase.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';


class GetAllCarModels implements UseCase<List<CarModel>, NoParams> {
  final TurbostatRepository repository;

  GetAllCarModels(this.repository);

  @override
  Future<Either<Failure, List<CarModel>>> call(NoParams params) async {
    return await repository.getAllCarModels();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
