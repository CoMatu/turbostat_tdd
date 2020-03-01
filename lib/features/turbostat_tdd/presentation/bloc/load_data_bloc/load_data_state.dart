import 'package:equatable/equatable.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';

abstract class LoadDataState extends Equatable {
  const LoadDataState();
}

class Loading extends LoadDataState {
  @override
  List<Object> get props => [];
}

class LoadedAllCars extends LoadDataState {
  final List<CarModel> listAll;

  LoadedAllCars({@required this.listAll});
  @override
  List<Object> get props => [listAll];
}

class LoadedConcreteCar extends LoadDataState {
  final CarModel concreteCar;

  LoadedConcreteCar({@required this.concreteCar});
  @override
  List<Object> get props => [concreteCar];
}

class LoadedCarMileage extends LoadDataState {
  final MileageModel mileage;

  LoadedCarMileage({@required this.mileage});
  @override
  List<Object> get props => [mileage];
}

class Error extends LoadDataState {
  final String message;

  Error({@required this.message});
  @override
  List<Object> get props => [message];
}
