import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part.dart';
import 'package:meta/meta.dart';

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