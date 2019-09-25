import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/entry.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/maintenance.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/part.dart';

class CarInfo extends Equatable {
  final Car car;
  final List<Maintenance> maintenanciesList;
  final List<Entry> entriesList;
  final List<Part> partsList;

  CarInfo({
    @required this.car,
    @required this.maintenanciesList,
    @required this.entriesList,
    @required this.partsList
    }) : super([
      car,
      maintenanciesList,
      entriesList,
      partsList,
    ]);
}