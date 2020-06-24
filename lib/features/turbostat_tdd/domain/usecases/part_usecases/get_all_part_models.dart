import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/usecases/usecase.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class GetAllPartModels implements UseCase<List<PartModel>, Params> {
  final TurbostatRepository repository;

  GetAllPartModels({@required this.repository});

  @override
  Future<Either<Failure, List<PartModel>>> call(Params params) async {
    return await repository.getAllPartModels(params.carId);
  }
}

class Params extends Equatable {
  final String carId;

  Params({@required this.carId});

  @override
  List<Object> get props => [carId];
}
