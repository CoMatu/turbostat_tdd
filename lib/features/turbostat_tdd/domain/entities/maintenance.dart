import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Maintenance extends Equatable {
  final String maintenanceId;
  final String maintenanceName;
  final int maintenanceMileageLimit;
  final int maintenanceMonthLimit;

  Maintenance(
      {
      @required this.maintenanceId,
      @required this.maintenanceName,
      @required this.maintenanceMileageLimit,
      @required this.maintenanceMonthLimit
      }) : super([
        maintenanceId,
        maintenanceName,
        maintenanceMileageLimit,
        maintenanceMonthLimit
      ]);
}
