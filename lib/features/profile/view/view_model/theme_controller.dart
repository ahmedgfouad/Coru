import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {

  ThemeMode _themeMode = ThemeMode.light;
  bool index = true;

  get themeMode => _themeMode;
  toggleTheme(bool index) {
    this.index = index;
    _themeMode = index ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}