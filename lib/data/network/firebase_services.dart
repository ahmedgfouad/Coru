import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';

class FirebaseServices {
  CollectionReference allCourses =
      FirebaseFirestore.instance.collection('course_details');

  Future<List<CourseDetailsModel>?>? getAllCourses() async {
    List<CourseDetailsModel>? courses = [];
    QuerySnapshot querySnapshot = await allCourses.get();
    dataLoop(
      snapShotData: querySnapshot.docs,
      modelData: courses,
    );
    return courses;
  }

  void dataLoop({
    var snapShotData,
    required List modelData,
  }) {
    for (var document in snapShotData) {
      CourseDetailsModel courseDetailsModel =
          CourseDetailsModel.fromJson(document.data() as Map<String, dynamic>);
      courseDetailsModel.id = document.id;
      modelData.add(courseDetailsModel);
    }
  }

  Future<List<CourseDetailsModel>?>? getTopCourses() async {
    List<CourseDetailsModel>? topCourses = [];

    QuerySnapshot querySnapshot =
        await allCourses.where('rating', isGreaterThan: '4').get();

    dataLoop(snapShotData: querySnapshot.docs, modelData: topCourses);
    return topCourses;
  }

  Future<List<CourseDetailsModel>?>? getCourseCategories(
    String category,
  ) async {
    List<CourseDetailsModel>? courseCategory = [];
    QuerySnapshot querySnapshot =
        await allCourses.where('category', isEqualTo: category).get();
    dataLoop(snapShotData: querySnapshot.docs, modelData: courseCategory);

    return courseCategory;
  }

  Future<CourseDetailsModel> getRecentCourse(String docId) async {
    DocumentSnapshot recentCourse = await allCourses.doc(docId).get();
    log("recent course= ${recentCourse.id.toString()}");

    CourseDetailsModel courseDetailsModel = CourseDetailsModel.fromJson(
        recentCourse.data() as Map<String, dynamic>);
    return courseDetailsModel;
  }
}
