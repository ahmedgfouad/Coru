// ignore_for_file: avoid_function_literals_in_foreach_calls 

import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  List<CourseDetailsModel> cartCourses = [];
  String _total = '0';
  String get total => _total;
  bool _isDuplicate = false;
  bool get isDuplicate => _isDuplicate;
  void addCourse(CourseDetailsModel course) {
    if (cartCourses.isEmpty) {
      cartCourses.add(course);
    } else {
      cartCourses.forEach((element) { 
        if (element.name == course.name) {
          _isDuplicate = true;
        }
      });
      if (!_isDuplicate) {
        cartCourses.add(course);
      }
    }

    notifyListeners();
  }

  removeCourse(String courseId) {
    cartCourses.removeWhere((element) {
      if (element.id == courseId) {
        _total =
            (double.parse(_total) - double.parse(element.price!)).toString();
        return true;
      }
      return false;
    }); 
    notifyListeners();
  }

  void getTotal() {
    double price = 0;
    for (var i in cartCourses) {
      price += double.parse(i.price!);
    }
    _total = price.toString();
  }
}
