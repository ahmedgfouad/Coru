import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/my_course_model.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';

class UserInfoServices {
  CollectionReference allUsersInfo =
      FirebaseFirestore.instance.collection(userInfoCollectionName);

  Future<List<UserInfoModel>> getAllInfoFromUser() async {
    List<UserInfoModel> listOfUsersInof = [];
    QuerySnapshot querySnapshot = await allUsersInfo.get();
    listOfUsersInof = querySnapshot.docs
        .map((e) => UserInfoModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return listOfUsersInof;
  }

  Future<UserInfoModel> getUserInfo({required String userId}) async {
    UserInfoModel userInfo = UserInfoModel();
    DocumentSnapshot querySnapshot = await allUsersInfo.doc(userId).get();
    userInfo =
        UserInfoModel.fromJson(querySnapshot.data() as Map<String, dynamic>);
    log("user info= ${userInfo.myCourses}");
    return userInfo;
  }
  /* Future<UserInfoModel> getUserCourseProgress({required String userId}) async {
    UserInfoModel userInfo = UserInfoModel();
    DocumentSnapshot querySnapshot = await allUsersInfo.doc(userId).get();
    userInfo =
        UserInfoModel.fromJson(querySnapshot.data() as Map<String, dynamic>);
     
        return userInfo;
  } */
}
