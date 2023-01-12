import 'package:flutter/material.dart';

class Theme extends ChangeNotifier {
  bool _isDark = false;

  bool get getIsOrange {
    return _isDark;
  }

  Color get getColor {
    return _isDark ? Colors.white : Colors.black12;
  }

  set setColor(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
