import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/add_part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/delete_part_model.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/domain/usecases/get_all_part_models.dart';

import '../../../../injection_container.dart';

class Parts extends ChangeNotifier {
  final List<PartModel> _parts = [];

  UnmodifiableListView<PartModel> get parts {
    return UnmodifiableListView(_parts);
  }

  Future<void> add(String carId, PartModel model) async {
    await sl<AddPartModel>().addPartModel(carId, model);
    _parts.add(model);
    notifyListeners();
  }

  Future<void> update(String carId) async {
    _parts.clear();
    final result = await sl<GetAllPartModels>().call(Params(carId: carId));

    _parts.addAll(result.fold(
      (failure) => null,
      (result) => result,
    ));

    notifyListeners();
  }

  Future<void> delete(String carId, PartModel model) async {
    await sl<DeletePartModel>().deletePartModel(carId, model);
    update(carId);
    notifyListeners();
  }
}
