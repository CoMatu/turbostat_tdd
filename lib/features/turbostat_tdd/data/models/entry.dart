import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Entry extends Equatable {
  final String entryId;
  final String maintenanceId;
  final String entryNote;
  final DateTime entryDateTime;
  final double entryWorkPrice;
  final int entryMileage;

  Entry({
    @required this.entryId,
    @required this.maintenanceId,
    @required this.entryNote,
    @required this.entryDateTime,
    @required this.entryWorkPrice,
    @required this.entryMileage,
    }) : super([
      entryId,
      maintenanceId,
      entryNote,
      entryDateTime,
      entryWorkPrice,
      entryMileage,
    ]);
}