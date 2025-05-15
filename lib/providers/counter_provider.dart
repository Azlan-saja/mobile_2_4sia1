import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _valueCounter = 1;

  void tambahkan() {
    _valueCounter++;
    notifyListeners();
  }

  void kurangkan() {
    _valueCounter--;
    notifyListeners();
  }

  String get hasil => _valueCounter.toString();
  // String get hasil {
  //   return _valueCounter.toString();
  // }
}
