import 'dart:developer';

import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  final List<CourseDetailsModel> _cartCourses = [];
  List<CourseDetailsModel> get cartCourses => _cartCourses;
  String _total = '0';
  String get total => _total;
  void addCourse(CourseDetailsModel course) {
    /* if (_cartCourses.isEmpty) { */
      _cartCourses.add(course);
    /* } else { */
      /* for (var i in _cartCourses) {
        if (i.name != course.name) {
          _cartCourses.add(course);
        }
        /*  notifyListeners(); */
      } */
      /* _cartCourses
          .where((element) {
            log('element name: ${element.name}');
            log('course name: ${course.name}');
            return element.name != course.name;
          })
          .toList()
          .add(course); */
   // }

    /* notifyListeners(); */
  }

  removeCourse(CourseDetailsModel course) {
    _cartCourses.remove(course);
    log('message: message: $_cartCourses');
  }

  void getTotal() {
    double price = 0;
    for (var i in _cartCourses) {
      price += double.parse(i.price!);
    }
    _total = price.toString();
  }
}
