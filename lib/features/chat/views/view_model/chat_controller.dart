import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/data/network/user_services.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  final UserServices _userInfoServices = UserServices();
  TextEditingController searchController = TextEditingController();
  bool isSearchFieldEmpty = true;
  List<UserInfoModel> allUsersInfo = [];

  void changeSearchStateToEmpty() {
    isSearchFieldEmpty = true;
    notifyListeners();
  }

  void changeSearchStateToNotEmpty() {
    isSearchFieldEmpty = false;
    notifyListeners();
  }

  void getallUsersInfo() async {
    allUsersInfo = await _userInfoServices.getAllUsersInfo();
    notifyListeners();
  }

  void searchForUser(String name) async {
    allUsersInfo = await _userInfoServices.getAllUsersInfo().then(
          (value) => value.where(
            (element) {
              var fullName = "${element.firstName}${element.lasttName}";
              return fullName.toLowerCase().contains(name);
            },
          ).toList(),
        );
    notifyListeners();
  }

  void addChat({
    required userId,
    required frientId, 
  }) {
    _userInfoServices.addNewChat(
      userId: userId,
      friendId: frientId,
    );
    notifyListeners();
  }
}
