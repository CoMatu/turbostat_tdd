import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:nanoid/async/nanoid.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';

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
  Future<List<EntryModel>> getEntries(String carId, String maintenanceId);
  Future<void> deleteEntry(String carId, String entryId);
  Future<List<EntryModel>> getAllEntries(String carId);
  Future<void> addPart(String carId, PartModel model);
  Future<void> deletePart(String carId, PartModel model);
  Future<List<PartModel>> getAllParts(String carId);
  Future<void> addEntryParts(String entryId, List<PartModel> partsList);
  Future<List<PartModel>> getEntryParts(String entryId);
  Future<void> addCarMileage(String carId, MileageModel mileage);
  Future<MileageModel> getLastMileageMode(String carId);
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
    final boxResult = carsBox.toMap();

    _carsFromDataBase = boxResult.entries
        .map((entry) => CarModel.fromJson(entry.value.cast<String, dynamic>()))
        .toList();

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
    final String name = 'maint_' + carId;
    final maintBox = await Hive.openBox(name);
    final maintString = model.toJson();
    maintBox.put(model.maintenanceId, maintString);
    print('added maintenance $maintString');
  }

  @override
  Future<List<MaintenanceModel>> getCarMaintenancies(String carId) async {
    List<MaintenanceModel> maintsFromDataBase = [];
    final String name = 'maint_' + carId;
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
    final String name = 'maint_' + carId;
    final maintBox = await Hive.openBox(name);
    await maintBox.delete(maintenanceId);
  }

  @override
  Future<MaintenanceModel> concreteMaintenance(
      String carId, String maintenanceId) async {
    List<MaintenanceModel> _maintsFromDataBase = [];

    final String name = 'maint_' + carId;
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
  Future<void> addEntry(String carId, EntryModel model) async {
    final String name = 'entries_' + carId;
    final entriesBox = await Hive.openBox(name);
    final _entryString = model.toJson();
    entriesBox.put(model.entryId, _entryString);
    print('added entry $_entryString');
  }

  @override
  Future<List<EntryModel>> getEntries(
      String carId, String maintenanceId) async {
    List<EntryModel> _entriesFromHive = [];
    final String name = 'entries_' + carId;
    final entriesBox = await Hive.openBox(name);

    final res = entriesBox.toMap();

    _entriesFromHive = res.entries
        .map(
            (entry) => EntryModel.fromJson(entry.value.cast<String, dynamic>()))
        .toList();

    final entries =
        _entriesFromHive.where((res) => res.maintenanceId == maintenanceId).toList();
    return entries;
  }

  @override
  Future<void> deleteEntry(String carId, String entryId) async {
    final String name = 'entries_' + carId;
    final entriesBox = await Hive.openBox(name);
    await entriesBox.delete(entryId);
  }

  @override
  Future<List<EntryModel>> getAllEntries(String carId) async {
    List<EntryModel> _entriesFromHive = [];
    final String name = 'entries_' + carId;
    final entriesBox = await Hive.openBox(name);

    final res = entriesBox.toMap();

    _entriesFromHive = res.entries
        .map(
            (entry) => EntryModel.fromJson(entry.value.cast<String, dynamic>()))
        .toList();

    return _entriesFromHive;
  }

  @override
  Future<void> addPart(String carId, PartModel model) async {
    final String name = 'parts_' + carId;
    final partsBox = await Hive.openBox(name);
    final _partString = model.toJson();
    partsBox.put(model.partId, _partString);
    print('added part $_partString');
  }

  @override
  Future<void> deletePart(String carId, PartModel model) async {
    final String name = 'parts_' + carId;
    final partsBox = await Hive.openBox(name);
    await partsBox.delete(model.partId);
  }

  @override
  Future<List<PartModel>> getAllParts(String carId) async {
    List<PartModel> _partsFromHive = [];
    final String name = 'parts_' + carId;
    final partsBox = await Hive.openBox(name);
    final res = partsBox.toMap();

    _partsFromHive = res.entries
        .map((part) => PartModel.fromJson(part.value.cast<String, dynamic>()))
        .toList();

    return _partsFromHive;
  }

  @override
  Future<void> addEntryParts(String entryId, List<PartModel> partsList) async {
    final String name = 'usedParts';
    var _list = [];
    final usedPartsBox = await Hive.openBox(name);
    partsList.forEach((element) {
      final _part = element.toJson();
      print(_part);
      _list.add(_part);
    });

    usedPartsBox.put(entryId, _list);
  }

  @override
  Future<List<PartModel>> getEntryParts(String entryId) async {
    List<PartModel> _partsFromHive = [];
    final String name = 'usedParts';
    final usedPartsBox = await Hive.openBox(name);
//    usedPartsBox.delete(entryId); //for delete errors
    final res = usedPartsBox.get(entryId);
//    print(res);
    if (res != null) {
      _partsFromHive = List<PartModel>.from(
          res.map((e) => PartModel.fromJson(e.cast<String, dynamic>())));
    }
    return _partsFromHive;
  }

  @override
  Future<void> addCarMileage(String carId, MileageModel mileage) async {
    final String name = 'carMileage_' + carId;
    final dataToBox = mileage.toJson();
    final carMileageBox = await Hive.openBox(name);
    var mileageKey = await nanoid(4);
    carMileageBox.put(mileageKey, dataToBox);
  }

  @override
  Future<MileageModel> getLastMileageMode(String carId) async {
    List<MileageModel> _mileageFromHive = [];
    final String name = 'carMileage_' + carId;
    final carMileageBox = await Hive.openBox(name);
    final _res = carMileageBox.toMap();
    _mileageFromHive = _res.entries
        .map(
            (part) => MileageModel.fromJson(part.value.cast<String, dynamic>()))
        .toList();

    _mileageFromHive.sort((a, b) => b.mileageDateTime.millisecondsSinceEpoch
        .compareTo(a.mileageDateTime.millisecondsSinceEpoch));

    return _mileageFromHive.first;
  }
}
