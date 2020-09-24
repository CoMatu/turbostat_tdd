part of 'load_mileage_bloc.dart';

abstract class LoadMileageEvent extends Equatable {
  const LoadMileageEvent();
}

class GetMileage extends LoadMileageEvent {
  final String carId;

  GetMileage({@required this.carId});

  @override
  List<Object> get props => [carId];
}

class AddMileage extends LoadMileageEvent {
  final String carId;

  AddMileage({@required this.carId});
  @override
  List<Object> get props => [carId];
}
