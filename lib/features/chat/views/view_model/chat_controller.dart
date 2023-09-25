import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/data/network/user_info_services.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  final UserInfoServices _userInfoServices = UserInfoServices();

  UserInfoModel? _userData;
  UserInfoModel? get userDataFromSearchingByName => _userData;

  getUserDatafromsearchingByName(String name) async {
    _userData = await _userInfoServices.searchForUserByName(nameOfUser: name);
    notifyListeners();
  }
}
