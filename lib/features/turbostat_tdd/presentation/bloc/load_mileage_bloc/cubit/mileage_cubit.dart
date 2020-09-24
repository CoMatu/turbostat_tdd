import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
part 'mileage_state.dart';

class MileageCubit extends Cubit<MileageState> {
  final TurbostatRepository _repository;

  MileageCubit(this._repository) : super(MileageInitial());

  Future<void> getCarMileage(String carId) async {
    emit(MileageLoading());
    final mileageOrFailure = await _repository.getLastMileageModel(carId);
    mileageOrFailure.fold(
      (l) => Error(message: _mapFailureToMessage(l)),
      (r) => emit(MileageLoaded(r)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    // Instead of a regular 'if (failure is ServerFailure)...'
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
