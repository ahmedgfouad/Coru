import 'package:flutter/material.dart';

class UserGusetController extends ChangeNotifier {
  bool isGuest = false;

  changeCurentState() {
    isGuest = !isGuest;
    notifyListeners();
  }
}
