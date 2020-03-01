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
  final MileageModel mileage;

  AddMileage({@required this.carId, @required this.mileage});
  @override
  List<Object> get props => [carId, mileage];
}
