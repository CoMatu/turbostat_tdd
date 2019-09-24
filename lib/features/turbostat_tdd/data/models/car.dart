import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Car extends Equatable {
  final String carId;
  final String carVin;
  final String carModel;
  final String carName;
  final String carMark;
  final int carYear;
  final int carMileage;

  Car({
      @required this.carId,
      @required this.carVin,
      @required this.carModel,
      @required this.carName,
      @required this.carMark,
      @required this.carYear,
      @required this.carMileage
      }) : super([
          carId,
          carVin,
          carModel,
          carMark,
          carName,
          carMileage,
          carYear,
        ]);
}
