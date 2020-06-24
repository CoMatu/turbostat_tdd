import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/core/usecases/usecase.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class GetEntries implements UseCase<List<EntryModel>, Params> {
  final TurbostatRepository repository;

  GetEntries({@required this.repository});

  @override
  Future<Either<Failure, List<EntryModel>>> call(Params params) async {
      return await repository.getEntries(params.carId, params.maintenanceId);
    }
  }
  
class Params extends Equatable {
  final String carId;
  final String maintenanceId;

  Params({@required this.carId, @required this.maintenanceId});

  @override
  List<Object> get props => [carId, maintenanceId];
}
