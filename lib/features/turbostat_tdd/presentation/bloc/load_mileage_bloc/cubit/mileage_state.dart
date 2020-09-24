part of 'mileage_cubit.dart';

abstract class MileageState extends Equatable {
  const MileageState();

  @override
  List<Object> get props => [];
}

class MileageInitial extends MileageState {
  const MileageInitial();
}

class MileageLoading extends MileageState {
  const MileageLoading();
}

class MileageLoaded extends MileageState {
  final MileageModel mileageModel;
  const MileageLoaded(this.mileageModel);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MileageLoaded && o.mileageModel == mileageModel;
  }

  @override
  int get hashCode => mileageModel.hashCode;
}

class MileageError extends MileageState {
  final String message;
  const MileageError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MileageError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
