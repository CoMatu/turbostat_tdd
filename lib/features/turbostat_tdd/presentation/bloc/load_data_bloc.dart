import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_car_models.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_concrete_car_model.dart';
import './bloc.dart';

class LoadDataBloc extends Bloc<LoadDataEvent, LoadDataState> {
  final GetAllCarModels getAllCarModels;
  final GetConcreteCarModel getConcreteCarModel;

  LoadDataBloc({
    @required GetAllCarModels allCarModels,
    @required GetConcreteCarModel concrete,
  })  : assert(allCarModels != null),
        assert(concrete != null),
        getAllCarModels = allCarModels,
        getConcreteCarModel = concrete;

  @override
  LoadDataState get initialState => InitialLoadDataState();

  @override
  Stream<LoadDataState> mapEventToState(
    LoadDataEvent event,
  ) async* {
    if(event is GetAllCar){
      yield Loading();
      final failureOrAllCars = await getAllCarModels;
    }
  }
}
