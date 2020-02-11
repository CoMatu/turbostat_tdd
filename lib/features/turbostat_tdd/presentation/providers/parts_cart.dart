import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/part_model.dart';

class PartsCart extends ChangeNotifier {
    final List<PartModel> _parts = [];

  UnmodifiableListView<PartModel> get partsCart {
    return UnmodifiableListView(_parts);
  }

  void add(PartModel part) {
    _parts.add(part);
    notifyListeners();
  }

  void clearCart() {
    _parts.clear();
    notifyListeners();
  }

  void delete(PartModel part) {
   // _parts.removeWhere((element) => element.partId == part.partId);
    _parts.remove(part);
    notifyListeners();
  }
}