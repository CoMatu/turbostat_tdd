import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';

abstract class LoadDataEvent extends Equatable {
  const LoadDataEvent();
}

class GetAllCar extends LoadDataEvent {
  @override
  List<Object> get props => [];
}

class GetConcreteCar extends LoadDataEvent {
  final String carId;

  GetConcreteCar(this.carId);
  @override
  List<Object> get props => [carId];
}

class AddConcreteCar extends LoadDataEvent {
  final CarModel car;

  AddConcreteCar({@required this.car});
  @override
  List<Object> get props => [car];
}

class DeleteConcreteCar extends LoadDataEvent {
  final String carKey;

  DeleteConcreteCar({@required this.carKey});
  @override
  List<Object> get props => [carKey];
}

class GetMileage extends LoadDataEvent {
  final String carId;

  GetMileage({@required this.carId});

  @override
  List<Object> get props => [carId];
}

class AddMileage extends LoadDataEvent {
  final String carId;
  final MileageModel mileage;

  AddMileage({@required this.carId, @required this.mileage});
  @override
  List<Object> get props => [carId, mileage];
}
