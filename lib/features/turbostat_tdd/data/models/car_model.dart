import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car.dart';
import 'package:meta/meta.dart';

class CarModel extends Car {
  CarModel({
  @required String carId,
  @required String carVin,
  @required String carModel,
  @required String carName,
  @required String carMark,
  @required int carYear,
  @required int carMileage,
  }) : super(
    carId: carId,
    carVin: carVin,
    carModel: carModel,
    carName: carName,
    carMark: carMark,
    carYear: carYear,
    carMileage: carMileage,
  );

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      carId: json['carId'],
      carMark: json['carMark'],
      carModel: json['carModel'],
      carName: json['carName'],
      carVin: json['carVin'],
      carMileage: json['carMileage'],
      carYear: json['carYear'],
    );
  }
}