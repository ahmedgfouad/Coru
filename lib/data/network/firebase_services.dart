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
    List<CourseDetailsModel>? topCourses = [];

    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await allCourses.where('rating', isGreaterThan: '4').get();

    // Get data from docs and convert map to List
    topCourses = querySnapshot.docs
        .map((doc) =>
            CourseDetailsModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return topCourses;
  }

  Future<List<CourseDetailsModel>?>? getCourseCategories(
      String category) async {
    List<CourseDetailsModel>? courseCategory = [];
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await allCourses.where('category', isEqualTo: category).get();

    // Get data from docs and convert map to List
    courseCategory = querySnapshot.docs
        .map((doc) =>
            CourseDetailsModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return courseCategory;
  }

  Future<CourseDetailsModel> getRecentCourse(int index) async {
    
    QuerySnapshot recentCourse = await allCourses.get();
    log(recentCourse.toString());
    //String id = recentCourse.docs[index].id;
    
    CourseDetailsModel courseDetailsModel = CourseDetailsModel.fromJson(
        recentCourse.docs[index].data() as Map<String, dynamic>);
    //log(id);
    return courseDetailsModel;
  }
}
