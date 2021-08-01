import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String _value;
  bool _change = false;
  String get value => _value;
  bool get change => _change;
  void addValue(String value) {
    print(value);
    _value = value;
    notifyListeners();
  }

  void addChange(bool value) {
    _change = value;
    notifyListeners();
  }
}
