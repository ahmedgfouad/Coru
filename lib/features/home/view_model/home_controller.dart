import 'dart:developer';

import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/data/network/firebase_services.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  
 final FirebaseServices _firebaseServices = FirebaseServices();
  List<CourseDetailsModel>? _topCourses;
  List<CourseDetailsModel>? get topCourses => _topCourses; 

  void getTopCourses() async {
    log('5');
    _topCourses = await _firebaseServices.getTopCourses();
    log('6');
    notifyListeners();
  }

  
}
