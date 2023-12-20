import 'dart:developer';

import 'package:flutter/material.dart';

class LocalizationController extends ChangeNotifier {
  Locale _locale = const Locale('en');
  int index = 0;
  int english = 0;
  int arabic = 1;
  get local => _locale;
  toggleLanguage(int index) {
    this.index = index;
    _locale = index == english ? const Locale('en') : const Locale('ar');
    log('$index');
    notifyListeners();
  }
}
