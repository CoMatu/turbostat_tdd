import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/entry_usecases/add_entry_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/entry_usecases/get_all_entries.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/entry_usecases/get_entries.dart'
    as gE;
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
    final result = await sl<gE.GetEntries>()
        .call(gE.Params(carId: carId, maintenanceId: maintenanceId));
    _entries.clear();

    _entries.addAll(result.fold(
      (failure) => null,
      (result) => result,
    ));

    notifyListeners();
  }

  Future<void> updateAll(String carId) async {
    final result = await sl<GetAllEntries>().call(Params(carId: carId));
    _entries.clear();

    _entries.addAll(result.fold(
      (failure) => null,
      (result) => result,
    ));

    // sort by date
    _entries.sort((a, b) => b.entryDateTime.millisecondsSinceEpoch
        .compareTo(a.entryDateTime.millisecondsSinceEpoch));

    notifyListeners();
  }
}
