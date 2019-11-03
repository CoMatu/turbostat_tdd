import 'package:equatable/equatable.dart';

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
