import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';

class FirebaseServices {
  CollectionReference allCourses =
      FirebaseFirestore.instance.collection('course_details');

  Future<List<CourseDetailsModel>?>? getAllCourses() async {
    List<CourseDetailsModel>? courses = [];
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await allCourses.get();

    // Get data from docs and convert map to List
    courses = querySnapshot.docs
        .map((doc) =>
            CourseDetailsModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return courses;
  }

  Future<List<CourseDetailsModel>?>? getTopCourses() async {
    log('1');
    List<CourseDetailsModel>? topCourses = [];
    log('2');
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await allCourses.where('rating', isGreaterThan: '4').get();
log('3');
    // Get data from docs and convert map to List
    topCourses = querySnapshot.docs
        .map((doc) =>
            CourseDetailsModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
        log('4');
    return topCourses;
  }

  Future<List<CourseDetailsModel>?>? getCourseCategories() async {
    List<CourseDetailsModel>? courseCategory = [];
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await allCourses.where('rate', isGreaterThan: 4).get();

    // Get data from docs and convert map to List
    courseCategory = querySnapshot.docs
        .map((doc) =>
            CourseDetailsModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return courseCategory;
  }
}
