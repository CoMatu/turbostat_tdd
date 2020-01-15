import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/data/models/entry_model.dart';

class CurrentEntry extends ChangeNotifier {
  EntryModel _entry;

  EntryModel get currentEntry => _entry;

  void update(EntryModel entry) async {
    _entry = entry;
    notifyListeners();
  }
}