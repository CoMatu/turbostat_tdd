import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';

List<MaintenanceModel> maintList = [
  MaintenanceModel(
    maintenanceId: '001',
    maintenanceName: 'Замена моторного масла и фильтра',
    maintenanceMonthLimit: 12,
    maintenanceMileageLimit: 10000,
  ),
  MaintenanceModel(
    maintenanceId: '002',
    maintenanceName: 'Замена воздушного фильтра двигателя',
    maintenanceMonthLimit: 6,
    maintenanceMileageLimit: 5000,
  ),
  MaintenanceModel(
    maintenanceId: '003',
    maintenanceName: 'Замена свечей зажигания (обычного типа)',
    maintenanceMonthLimit: 12,
    maintenanceMileageLimit: 15000,
  ),
  MaintenanceModel(
    maintenanceId: '004',
    maintenanceName: 'Замена тормозной жидкости',
    maintenanceMonthLimit: 24,
    maintenanceMileageLimit: 30000,
  ),
  MaintenanceModel(
    maintenanceId: '005',
    maintenanceName: 'Замена воздушного фильтра салона',
    maintenanceMonthLimit: 24,
    maintenanceMileageLimit: 30000,
  ),
  MaintenanceModel(
    maintenanceId: '006',
    maintenanceName: 'Замена масла в АКПП',
    maintenanceMonthLimit: 48,
    maintenanceMileageLimit: 60000,
  ),
  MaintenanceModel(
    maintenanceId: '007',
    maintenanceName: 'Замена охлаждающей жидкости',
    maintenanceMonthLimit: 72,
    maintenanceMileageLimit: 90000,
  ),
];
