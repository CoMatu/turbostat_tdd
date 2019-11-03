import 'package:equatable/equatable.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:meta/meta.dart';

abstract class LoadDataState extends Equatable {
  const LoadDataState();
}

class InitialLoadDataState extends LoadDataState {
  @override
  List<Object> get props => [];
}

class Loading extends LoadDataState {
  @override
  List<Object> get props => [];
}

class Loaded extends LoadDataState {
  final List<CarModel> list;

  Loaded(this.list);
  @override
  List<Object> get props => [list];
}

class Error extends LoadDataState {
  final String message;

  Error({@required this.message});
  @override
  List<Object> get props => [message];
}
