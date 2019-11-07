class PageCounter {
  static final PageCounter _appData = PageCounter._internal();
  
  int pageIndex;
  factory PageCounter() {
    return _appData;
  }
  PageCounter._internal();
}

final pageCounter = PageCounter();