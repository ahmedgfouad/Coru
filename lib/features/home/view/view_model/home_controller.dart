import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/data/network/firebase_services.dart';
import 'package:elearning_app/data/network/user_services.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<Map<String, dynamic>> category = [
    {'title': 'All courses', 'icon': AppImages.allCourses},
    {'title': 'medical', 'icon': AppImages.medical},
    {'title': 'Programming', 'icon': AppImages.programming},
    {'title': 'marketing', 'icon': AppImages.marketing},
    {'title': 'Business', 'icon': AppImages.business},
    {'title': 'Graphic Design', 'icon': AppImages.d3Design},
  ];

  final FirebaseServices _firebaseServices = FirebaseServices();
  final UserServices _userServices = UserServices();

  List<CourseDetailsModel>? _courses;
  List<CourseDetailsModel>? get courses => _courses;

  List<CourseDetailsModel>? _topCourses;
  List<CourseDetailsModel>? get topCourses => _topCourses;

  CourseDetailsModel? recentCourse;
  String? courseDocId;
  List<CourseDetailsModel> userProgressCourses = [];
  List<CourseDetailsModel> userCompleteCourses = [];
  List<String> listOFBookMarCourses = [];

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
    courseDocId = recentCourse!.id;
    recentCourse = await _firebaseServices.getRecentCourse(recentCourse!.id!);
    notifyListeners();
  }

  void savedCourseIdInBookMark() async {
    listOFBookMarCourses =
        await _userServices.addCourseInBookMark(courseDocId!);
    notifyListeners();
  }

  void delelteCorrseFormBookMark(int index) async {
    listOFBookMarCourses.removeAt(index);
    listOFBookMarCourses =
        await _userServices.deleteCourseFromBookMark(listOFBookMarCourses);
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
