import 'dart:developer';

import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  List<CourseDetailsModel> cartCourses =
      []; /* 
  List<CourseDetailsModel> get cartCourses => _cartCourses; */

  String _total = '0';
  String get total => _total;
  bool _isDuplicate = false;
  bool get isDuplicate => _isDuplicate;
  void addCourse(CourseDetailsModel course) {
    if (cartCourses.isEmpty) {
      cartCourses.add(course);
    } else {
      cartCourses.forEach((element) {
        log('element name: ${element.name}');
        log('course name: ${course.name}');
        if (element.name == course.name) {
          _isDuplicate = true;
          /* newCart.add(course); */
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

    log('message: message: $cartCourses');
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
