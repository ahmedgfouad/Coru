import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/data/network/firebase_services.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final FirebaseServices _firebaseServices = FirebaseServices();

  List<CourseDetailsModel>? _courses;
  List<CourseDetailsModel>? get courses => _courses;

  List<CourseDetailsModel>? _topCourses;
  List<CourseDetailsModel>? get topCourses => _topCourses;

  CourseDetailsModel? /* get  */ recentCourse /*  => _recentCourse */;
  List<CourseDetailsModel> userProgressCourses = [];
  List<CourseDetailsModel> userCompleteCourses = [];

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

  void getRecentCourse() async {
    recentCourse = await _firebaseServices.getRecentCourse(recentCourse!.id!);
    notifyListeners();
  }

  void getSearchedCourses(String searchedCourses) async {
    _courses = await _firebaseServices.getAllCourses()!.then((value) => value!
        .where(
          (searcedCourse) =>
              searcedCourse.name!.toLowerCase().contains(searchedCourses),
        )
        .toList());
    notifyListeners();
  }
}
