import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_car_mileage.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/delete_car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_car_models.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_car_mileage.dart' as getCM;
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_concrete_car_model.dart';

import 'load_data.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class LoadDataBloc extends Bloc<LoadDataEvent, LoadDataState> {
  final GetAllCarModels getAllCarModels;
  final GetConcreteCarModel getConcreteCarModel;
  final AddCarModel addCarModel;
  final DeleteCarModel deleteConcreteCar;
  final getCM.GetCarMileage getCarMileage;
  final AddCarMileage addCarMileage;

  final TurbostatRepository repository;

  LoadDataBloc({
    @required GetAllCarModels allCarModels,
    @required GetConcreteCarModel concrete,
    @required AddCarModel addCar,
    @required DeleteCarModel deleteCar,
    @required getCM.GetCarMileage getMileage,
    @required AddCarMileage addMileage,
    @required this.repository,
  })  : assert(allCarModels != null),
        assert(concrete != null),
        assert(getMileage != null),
        assert(addMileage != null),
        getAllCarModels = allCarModels,
        getConcreteCarModel = concrete,
        addCarModel = addCar,
        deleteConcreteCar = deleteCar,
        getCarMileage = getMileage,
        addCarMileage = addMileage;

  @override
  LoadDataState get initialState => Loading();

  @override
  Stream<LoadDataState> mapEventToState(
    LoadDataEvent event,
  ) async* {
    if (event is GetAllCar) {
      yield Loading();
      final failureOrAllCars = await getAllCarModels(NoParams());
      yield failureOrAllCars.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (allCarModels) => LoadedAllCars(listAll: allCarModels),
      );
    } else if (event is GetConcreteCar) {
      yield Loading();
      final failureOrConcreteCar =
          await getConcreteCarModel(Params(carId: event.carId));
      yield failureOrConcreteCar.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (concreteCar) => LoadedConcreteCar(concreteCar: concreteCar),
      );
    } else if (event is AddConcreteCar) {
      await repository.addConcreteCarModel(event.car);
      print('in bloc ' + event.car.toString());
    } else if (event is DeleteConcreteCar) {
      await repository.deleteCarModel(event.carKey);
    } else if (event is GetMileage) {
      yield Loading();
      final failureOrGetMileage =
          await getCarMileage(getCM.Params(carId: event.carId));
      yield failureOrGetMileage.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (carMileage) => LoadedCarMileage(mileage: carMileage),
      );
    } else if (event is AddMileage) {
      await repository.addCarMileage(event.carId, event.mileage);
      yield Loading();
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
