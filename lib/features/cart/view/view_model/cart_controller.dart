import 'dart:developer';

import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  List<CourseDetailsModel> cartCourses =
      []; /* 
  List<CourseDetailsModel> get cartCourses => _cartCourses; */
  List<CourseDetailsModel> newCart =
      []; /* 
  List<CourseDetailsModel> get newCart => _newCart; */
  String _total = '0';
  String get total => _total;
  void addCourse(CourseDetailsModel course) {
    if (cartCourses.isEmpty) {
      newCart.add(course);
      cartCourses = newCart;
    } else {
      /* for (var i in _cartCourses) {
        if (i.name != course.name) {
          _cartCourses.add(course);
        }
        /*  notifyListeners(); */
      } */
      /* newCart.add(course);
      cartCourses = newCart.where((element) {
        log('element name: ${element.name}');
        log('course name: ${course.name}');
        return element.name != course.name;
      }).toList(); */
       newCart.forEach((element) {
        log('element name: ${element.name}');
        log('course name: ${course.name}');
        if (element.name != course.name) {         
          newCart.add(course);
        }
      });
      cartCourses = newCart;
    }

    /* notifyListeners(); */
  }

  removeCourse(CourseDetailsModel course) {
    cartCourses.remove(course);
    log('message: message: $cartCourses');
  }

  void getTotal() {
    double price = 0;
    for (var i in cartCourses) {
      price += double.parse(i.price!);
    }
    _total = price.toString();
  }
}
