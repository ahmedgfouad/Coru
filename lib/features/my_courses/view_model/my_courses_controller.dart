import 'dart:developer';

import 'package:elearning_app/data/model/users_info/my_course_model.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/data/network/user_info_services.dart';
import 'package:flutter/material.dart';

class MyCoursesController extends ChangeNotifier {
  String id = 'Ss1DnVmF4wZqNAwBGH3omWbvHli1';
  List<MyCourseModel>? _myCoursesComplete;
  List<MyCourseModel>? get myCoursesComplete => _myCoursesComplete;
  List<MyCourseModel>? _myCoursesProgress;
  List<MyCourseModel>? get myCoursesProgress => _myCoursesProgress;
  getUserCourses() async {
    UserInfoModel userInfo = await UserInfoServices().getUserInfo(userId: id);
    _myCoursesComplete = [];
    _myCoursesProgress = [];
    for (var i in userInfo.myCourses!) {
      if (i.progress == '100') {
        log('progress value=${i.progress}');
        _myCoursesComplete!.add(i);
        log('progress=$_myCoursesProgress');
      } else {
        _myCoursesProgress!.add(i);
        log('complete=$_myCoursesComplete');
      }
    }
    notifyListeners();
  }
}
