import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_car_mileage.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_car_mileage.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';

part 'load_mileage_event.dart';
part 'load_mileage_state.dart';

//! don't use

class LoadMileageBloc extends Bloc<LoadMileageEvent, LoadMileageState> {
  final GetCarMileage getCarMileage;
  final AddCarMileage addCarMileage;

  LoadMileageBloc({
    @required GetCarMileage getMileage,
    @required AddCarMileage addMileage,
  })  : assert(getMileage != null),
        assert(addMileage != null),
        getCarMileage = getMileage,
        addCarMileage = addMileage;

  @override
  LoadMileageState get initialState => LoadMileageInitial();

  @override
  Stream<LoadMileageState> mapEventToState(
    LoadMileageEvent event,
  ) async* {
    if (event is GetMileage) {
      yield LoadMileageInitial();
      final failureOrGetMileage =
          await getCarMileage(Params(carId: event.carId));
      yield failureOrGetMileage.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (carMileage) => LoadedCarMileage(mileage: carMileage),
      );
    }
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
