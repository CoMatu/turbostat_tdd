part of 'load_mileage_bloc.dart';

abstract class LoadMileageState extends Equatable {
  const LoadMileageState();
}

class LoadMileageInitial extends LoadMileageState {
  @override
  List<Object> get props => [];
}

class LoadedCarMileage extends LoadMileageState {
  final MileageModel mileage;

  LoadedCarMileage({@required this.mileage});
  @override
  List<Object> get props => [mileage];
}

class Error extends LoadMileageState {
  final String message;

  Error({@required this.message});
  @override
  List<Object> get props => [message];
}
