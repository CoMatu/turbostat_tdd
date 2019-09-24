import 'package:equatable/equatable.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part.dart';
import 'package:meta/meta.dart';

class CarInfo extends Equatable {
  final Car car;
  final Set<Maintenance> maintenanciesSet;
  final Set<Entry> entriesSet;
  final List<Part> partsList;

  CarInfo({
    @required this.car,
    @required this.maintenanciesSet,
    @required this.entriesSet,
    @required this.partsList
    }) : super([
      car,
      maintenanciesSet,
      entriesSet,
      partsList,
    ]);
}