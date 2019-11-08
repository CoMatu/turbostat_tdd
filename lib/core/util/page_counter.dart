import 'dart:async';

class PageCounter {
  StreamController _streamController = StreamController();

  Stream get updatedIndex => _streamController.stream;

  void updateIndex(int index) {
    _streamController.add(index);
  }
}
