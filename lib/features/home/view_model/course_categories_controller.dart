import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/data/network/firebase_services.dart';
import 'package:flutter/material.dart';

class CourseCategoriesController extends ChangeNotifier {
  
 final FirebaseServices _firebaseServices = FirebaseServices();
  List<CourseDetailsModel>? _allCourses;
  List<CourseDetailsModel>? get allCourses => _allCourses;
  List<CourseDetailsModel>? _courseCategories;
  List<CourseDetailsModel>? get courseCategories => _courseCategories; 

  void getAllCourses() async {
    _allCourses = await _firebaseServices.getAllCourses();
    notifyListeners();
  }
  
  void getCourseCategories() async {
    _courseCategories = await _firebaseServices.getCourseCategories();
    notifyListeners();
  }
}
