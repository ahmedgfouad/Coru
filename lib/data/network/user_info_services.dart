import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';

class UserInfoServices {
  CollectionReference allUsersInfo =
      FirebaseFirestore.instance.collection(userInfoCollectionName);

  Future<List<UserInfoModel>> getAllInfoFromUsers() async {
    List<UserInfoModel> listOfUsersInof = [];
    QuerySnapshot querySnapshot = await allUsersInfo.get();
    listOfUsersInof = querySnapshot.docs
        .map((e) => UserInfoModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return listOfUsersInof;
  }

  Future<UserInfoModel> getInfoOneUserById({required String userId}) async {
    QuerySnapshot userInfo =
        await allUsersInfo.where(useridField, isEqualTo: userId).get();

    UserInfoModel userData = UserInfoModel.fromJson(
      userInfo.docs.first.data() as Map<String, dynamic>,
    );

    return userData;
  }

  Future<UserInfoModel> searchForUserByName(
      {required String nameOfUser}) async {
    QuerySnapshot userInfo =
        await allUsersInfo.where("first_name", isEqualTo: nameOfUser).get();

    UserInfoModel userData = UserInfoModel.fromJson(
      userInfo.docs.first.data() as Map<String, dynamic>,
    );

    return userData;
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
