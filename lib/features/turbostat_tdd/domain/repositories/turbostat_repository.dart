import 'package:dartz/dartz.dart';
import 'package:turbostat_tdd/core/error/failures.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';

abstract class TurbostatRepository {
  Future<Either<Failure, CarModel>> getConcreteCarModel(String carId);
  Future<Either<Failure, List<CarModel>>> getAllCarModels();
  Future<void> addConcreteCarModel(CarModel carModel);
  Future<void> deleteCarModel(String carKey);
  Future<void> addMaintenanceModel(MaintenanceModel model, String carId);
  Future<Either<Failure, List<MaintenanceModel>>> getCarMaintenancies(
      String carId);
  Future<Either<Failure, MaintenanceModel>> getConcreteMaintenance(
      String carId, String maintenanceId);
  Future<void> deleteMaintenance(String maintenanceId, String carId);
  Future<void> addEntryModel(String carId, EntryModel model);
  Future<Either<Failure, List<EntryModel>>> getEntries(
      String carId, String maintenanceId);
  Future<void> deleteEntry(String carId, String entryId);
  Future<Either<Failure, List<EntryModel>>> getAllEntries(String carId);
  Future<void> addPartModel(String carId, PartModel model);
  Future<void> deletePartModel(String carId, PartModel model);
  Future<Either<Failure, List<PartModel>>> getAllPartModels(String carId);
  Future<void> addEntryParts(String entryId, List<PartModel> partsList);
  Future<Either<Failure, List<PartModel>>> getEntryParts(String entryId);
  Future<void> addCarMileage(String carId, int mileage);
}
