import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/usecases/usecase.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class GetConcreteMaintenance implements UseCase<MaintenanceModel, Params> {
  final TurbostatRepository repository;

  GetConcreteMaintenance({@required this.repository});

  @override
  Future<Either<Failure, MaintenanceModel>> call(Params params) async {
    return await repository.getConcreteMaintenance(params.carId, params.maintenanceId);
  }
}

class Params extends Equatable {
  final String carId;
  final String maintenanceId;

  Params({@required this.carId, @required this.maintenanceId});

  @override
  List<Object> get props => [carId, maintenanceId];
}
