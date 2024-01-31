import 'package:flutter/material.dart';

class PageProviders with ChangeNotifier {
  int _currentIndex = 0;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int getIndex() => _currentIndex;
}