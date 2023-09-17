import 'dart:developer';

import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/data/network/firebase_services.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final FirebaseServices _firebaseServices = FirebaseServices();
  List<CourseDetailsModel>? _courses;
  List<CourseDetailsModel>? get courses => _courses;
  List<CourseDetailsModel>? _topCourses;
  List<CourseDetailsModel>? get topCourses => _topCourses;
  CourseDetailsModel? _recentCourse;
  CourseDetailsModel? get recentCourse => _recentCourse;
  int? _index;
  int? get index => _index;
  void getCourses({required String courseFilter}) async {
    if (courseFilter == 'All courses' || courseFilter == 'كل الدورات') {
      _courses = await _firebaseServices.getAllCourses();
    } else {
      _courses = await _firebaseServices.getCourseCategories(courseFilter);
    }

    notifyListeners();
  }

  void getTopCourses() async {
    _topCourses = await _firebaseServices.getTopCourses();
    notifyListeners();
  }

  void getRecentCourse(int index) async {
    _index = index;
    _recentCourse = await _firebaseServices.getRecentCourse(index);
    notifyListeners();
  }
}
