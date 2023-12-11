import 'package:elearning_app/data/model/users_info/my_course_model.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/data/network/user_services.dart';
import 'package:flutter/material.dart';

class MyCoursesController extends ChangeNotifier {
  String id = 'Ss1DnVmF4wZqNAwBGH3omWbvHli1';
  List<MyCourseModel>? _myCoursesComplete;
  List<MyCourseModel>? get myCoursesComplete => _myCoursesComplete;

  List<MyCourseModel>? _myCoursesProgress;
  List<MyCourseModel>? get myCoursesProgress => _myCoursesProgress;

  getUserCourses() async {
    UserInfoModel userInfo = await UserServices().getUserInfo(userId: id);
    _myCoursesComplete = [];
    _myCoursesProgress = [];
    for (var i in userInfo.myCourses!) {
      if (i.progress == '100') { 
        _myCoursesComplete!.add(i); 
      } else {
        _myCoursesProgress!.add(i); 
      }
    }
    notifyListeners();
  }
}
