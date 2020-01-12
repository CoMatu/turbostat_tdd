import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_entries.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_entries.dart' as gE;
import 'package:turbostat_tdd/injection_container.dart';

class Entries extends ChangeNotifier {
  final List<EntryModel> _entries = [];

  UnmodifiableListView<EntryModel> get entries {
    return UnmodifiableListView(_entries);
  }

  Future<void> add(String carId, EntryModel model) async {
    await sl<AddEntryModel>().addEntryModel(carId, model);
    _entries.add(model);

    notifyListeners();
  }

  Future<void> update(String carId, String maintenanceId) async {
    _entries.clear();
    final result = await sl<gE.GetEntries>()
        .call(gE.Params(carId: carId, maintenanceId: maintenanceId));
    _entries.addAll(result.fold(
      (failure) => null,
      (result) => result,
    ));

    notifyListeners();
  }

    Future<void> updateAll(String carId) async {
    _entries.clear();
    final result = await sl<GetAllEntries>()
        .call(Params(carId: carId));
    _entries.addAll(result.fold(
      (failure) => null,
      (result) => result,
    ));

    notifyListeners();
  }
}
