import 'package:equatable/equatable.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part.dart';
import 'package:meta/meta.dart';

class Entry extends Equatable {
  final String entryId;
  final String maintenanceId;
  final String maintenanceNote;
  final DateTime maintenanceDateTime;
  final int maintenanceWorkPrice;
  final int maintenanceMileage;
  final List<Part> maintenanceParts;

  Entry({
    @required this.entryId,
    @required this.maintenanceId,
    @required this.maintenanceNote,
    @required this.maintenanceDateTime,
    @required this.maintenanceWorkPrice,
    @required this.maintenanceMileage,
    @required this.maintenanceParts
    }) : super([
      entryId,
      maintenanceId,
      maintenanceNote,
      maintenanceDateTime,
      maintenanceWorkPrice,
      maintenanceMileage,
      maintenanceParts
    ]);
}