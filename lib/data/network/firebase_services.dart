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
    /* courses = querySnapshot.docs.map((doc) {
      for (var i in courses!) {
        i.id = doc.id;
        log("message: ${i.id.toString()}");
      }

      return CourseDetailsModel.fromJson(doc.data() as Map<String, dynamic>);
    }).toList(); */
    /* for (var document in querySnapshot.docs) {
      CourseDetailsModel courseDetailsModel =
          CourseDetailsModel.fromJson(document.data() as Map<String, dynamic>);
      courseDetailsModel.id = document.id;
      log(courseDetailsModel.id.toString());
      courses.add(courseDetailsModel);
    } */
    dataLoop(snapShotData: querySnapshot.docs,modelData:  courses);
    return courses;
  }

  void dataLoop({var snapShotData, required List modelData}) {
    for (var document in snapShotData) {
      CourseDetailsModel courseDetailsModel =
          CourseDetailsModel.fromJson(document.data() as Map<String, dynamic>);
      courseDetailsModel.id = document.id;
      //log('id=${courseDetailsModel.id.toString()}');
      modelData.add(courseDetailsModel);
    }
  }

  Future<List<CourseDetailsModel>?>? getTopCourses() async {
    List<CourseDetailsModel>? topCourses = [];

    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await allCourses.where('rating', isGreaterThan: '4').get();

    // Get data from docs and convert map to List
    /* topCourses = querySnapshot.docs
        .map((doc) =>
            CourseDetailsModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList(); */

    dataLoop(snapShotData: querySnapshot.docs,modelData:  topCourses);
    return topCourses;
  }

  Future<List<CourseDetailsModel>?>? getCourseCategories(
      String category) async {
    List<CourseDetailsModel>? courseCategory = [];
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await allCourses.where('category', isEqualTo: category).get();

    // Get data from docs and convert map to List
    /* courseCategory = querySnapshot.docs
        .map((doc) =>
            CourseDetailsModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList(); */
    dataLoop(snapShotData: querySnapshot.docs,modelData:  courseCategory);

    return courseCategory;
  }

  Future<CourseDetailsModel> getRecentCourse(String docId) async {
    DocumentSnapshot recentCourse = await allCourses.doc(docId).get();
    log("recent course= ${recentCourse.id.toString()}");
    //String id = recentCourse.docs[index].id;

    CourseDetailsModel courseDetailsModel = CourseDetailsModel.fromJson(
        recentCourse.data() as Map<String, dynamic>);
    //log(id);
    return courseDetailsModel;
  }

  /* Future<List<String>> getId() async {
    QuerySnapshot querySnapshot = await allCourses.get();
    List<String> id = querySnapshot.docs.map((e) => e.id).toList();
    log('$id');
    return id;
  } */
}
