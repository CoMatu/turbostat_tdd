import 'package:hive/hive.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';

abstract class TurbostatLocalDataSource {
  Future<CarModel> getConcreteCarModel(String carId);
  Future<List<CarModel>> getLastCarModels();
  Future<void> cacheListCarModels(List<CarModel> listCarModelsToCache);
  Future<void> addCarModel(CarModel carModel);
  Future<void> deleteCarModel(String carKey);
  Future<void> addMaintenanceModel(MaintenanceModel model, String carId);
  Future<List<MaintenanceModel>> getCarMaintenancies(String carId);
  Future<void> deleteMaintenance(String maintenanceId, String carId);
  Future<MaintenanceModel> concreteMaintenance(
      String carId, String maintenanceId);
  Future<void> addEntry(String carId, EntryModel model);
}

class TurbostatLocalDataSourceImpl implements TurbostatLocalDataSource {
  @override
  Future<void> cacheListCarModels(List<CarModel> listCarModelsToCache) async {
    //! final carsBox = await Hive.openBox('cars');
    //! listCarModelsToCache.forEach((f) => carsBox.add(f.toJson()));
  }

  @override
  Future<CarModel> getConcreteCarModel(String carId) async {
    List<CarModel> _carsFromDataBase = [];
    final carsBox = await Hive.openBox('cars');
    var ind = carsBox.length;
    for (int i = 0; i < ind; i++) {
      _carsFromDataBase.add(CarModel.fromJson(carsBox.get(i)));
    }
    final concreteCar = _carsFromDataBase.where((f) => f.carId == carId).first;
    return concreteCar;
  }

  @override
  Future<List<CarModel>> getLastCarModels() async {
    List<CarModel> carsFromDataBase = [];
    final carsBox = await Hive.openBox('cars');

    final boxResult = carsBox.toMap();

    carsFromDataBase = boxResult.entries
        .map((entry) => CarModel.fromJson(entry.value.cast<String, dynamic>()))
        .toList();
    return carsFromDataBase;
  }

  @override
  Future<void> addCarModel(CarModel carModel) async {
    final carsBox = await Hive.openBox('cars');
    final carString = carModel.toJson();
    carsBox.put(carModel.carId, carString);
    print('added car $carString');
  }

  @override
  Future<void> deleteCarModel(String carKey) async {
    final carsBox = await Hive.openBox('cars');
    // final res = carsBox.toMap();

    await carsBox.delete(carKey);
  }

  @override
  Future<void> addMaintenanceModel(MaintenanceModel model, String carId) async {
    String name = 'maint_' + carId;
    final maintBox = await Hive.openBox(name);
    final maintString = model.toJson();
    maintBox.put(model.maintenanceId, maintString);
    print('added maintenance $maintString');
  }

  @override
  Future<List<MaintenanceModel>> getCarMaintenancies(String carId) async {
    List<MaintenanceModel> maintsFromDataBase = [];
    String name = 'maint_' + carId;
    final maintBox = await Hive.openBox(name);

    final boxResult = maintBox.toMap();

    maintsFromDataBase = boxResult.entries
        .map((entry) =>
            MaintenanceModel.fromJson(entry.value.cast<String, dynamic>()))
        .toList();
    return maintsFromDataBase;
  }

  @override
  Future<void> deleteMaintenance(String maintenanceId, String carId) async {
    String name = 'maint_' + carId;
    final maintBox = await Hive.openBox(name);
    await maintBox.delete(maintenanceId);
  }

  @override
  Future<MaintenanceModel> concreteMaintenance(
      String carId, String maintenanceId) async {
    List<MaintenanceModel> _maintsFromDataBase = [];

    String name = 'maint_' + carId;
    final maintBox = await Hive.openBox(name);
    var ind = maintBox.length;
    for (int i = 0; i < ind; i++) {
      _maintsFromDataBase.add(MaintenanceModel.fromJson(maintBox.get(i)));
    }
    final concrete = _maintsFromDataBase
        .where((f) => f.maintenanceId == maintenanceId)
        .first;
    return concrete;
  }

  @override
  Future<void> addEntry(String carId, EntryModel model) {
    // TODO: implement addEntry
    throw UnimplementedError();
  }
}
