import 'package:flutter/material.dart';

class PageCounter extends ChangeNotifier {
  int _index = 0;

  int get pageIndex => _index;

  void updateIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
