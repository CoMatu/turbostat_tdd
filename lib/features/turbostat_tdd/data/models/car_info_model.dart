import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car_info.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/entry.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/maintenance.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/part.dart';
import 'package:meta/meta.dart';

class CarInfoModel extends CarInfo {
  
  CarInfoModel({
    @required Car car,
    @required List<Maintenance> maintenanciesList,
    @required List<Entry> entriesList,
    @required List<Part> partsList,
  }) : super(
          car: car,
          maintenanciesList: maintenanciesList,
          entriesList: entriesList,
          partsList: partsList
        );

  factory CarInfoModel.fromJson(Map<String, dynamic> json) {
    return null;
  }
}