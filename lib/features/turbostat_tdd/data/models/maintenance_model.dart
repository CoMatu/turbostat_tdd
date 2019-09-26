import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/maintenance.dart';
import 'package:meta/meta.dart';

class MaintenanceModel extends Maintenance {
  MaintenanceModel({
      @required maintenanceId,
      @required maintenanceName,
      @required maintenanceMileageLimit,
      @required maintenanceMonthLimit
  }) : super(
          maintenanceId: maintenanceId,
          maintenanceName: maintenanceName,
          maintenanceMileageLimit: maintenanceMileageLimit,
          maintenanceMonthLimit: maintenanceMonthLimit,
        );

  factory MaintenanceModel.fromJson(Map<String, dynamic> json) {
    return MaintenanceModel(
      maintenanceId: json['maintenanceId'],
      maintenanceName: json['maintenanceName'],
      maintenanceMileageLimit: json['maintenanceMileageLimit'],
      maintenanceMonthLimit: json['maintenanceMonthLimit'],
    );
  }
}