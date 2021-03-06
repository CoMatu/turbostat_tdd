// Cars

import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/car.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/entry.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/maintenance.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/entities/part.dart';

final Car mockCar_1 = Car(
  carId: '1',
  carName: 'car 1',
  carMark: 'nissan',
  carModel: 'note',
  carYear: 2012,
  carVin: 'VIN123',
  licencePlate: 'f333',
  fuelType: 'liquid',
  tankVolume: 38,
  carNote: 'car note',
);

final Car mockCar_2 = Car(
  carId: '2',
  carName: 'car 2',
  carMark: 'nissan',
  carModel: 'murano',
  carYear: 2017,
  carVin: 'VIN321',
  licencePlate: 'f333',
  fuelType: 'liquid',
  tankVolume: 38,
  carNote: 'car note',
);

// Maintenansies

final Maintenance mockMaint_1 = Maintenance(
  maintenanceId: '1',
  maintenanceName: 'Cabin filter',
  maintenanceMonthLimit: 12,
  maintenanceMileageLimit: 15000,
);

final Maintenance mockMaint_2 = Maintenance(
  maintenanceId: '2',
  maintenanceName: 'Oil filter',
  maintenanceMonthLimit: 12,
  maintenanceMileageLimit: 15000,
);

// Entries

final Entry mockEntry_1 = Entry(
    entryId: '1',
    maintenanceId: '1',
    entryName: 'name',
    entryDateTime: DateTime(2019, 22, 7),
    entryMileage: 80000,
    entryWorkPrice: 200.00,
    entryNote: 'entry note');

final Entry mockEntry_2 = Entry(
    entryId: '2',
    maintenanceId: '2',
    entryName: 'name',
    entryDateTime: DateTime(2019, 20, 8),
    entryMileage: 7700,
    entryWorkPrice: 150.00,
    entryNote: 'entry note');

// Parts

final Part mockPart_1 = Part(
  partId: 'part1',
  partCode: 'F1',
  partName: 'Filter 200AF',
  partPrice: 100.0,
);

final Part mockPart_2 = Part(
  partId: 'part2',
  partCode: 'FO12',
  partName: 'Filter oil34D',
  partPrice: 50.99,
);
