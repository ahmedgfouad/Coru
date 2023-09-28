import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  CollectionReference allUsersInfo =
      FirebaseFirestore.instance.collection(userInfoCollectionName);


  Future<UserCredential?> signupServices({
    required String email,
    required String password,
  }) async {
    UserCredential? userCredential;
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log("in firebase exeption ${e.toString()}");
    }
    return userCredential;
  }

  Future<UserCredential?> loginServices({
    required String email,
    required String password,
  }) async {  
        UserCredential? userCredential; 
    try {
       userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('لا يوجد مستخدم لهذا الايميل ');
      } else if (e.code == 'wrong-password') {
        log('كلمه المرور خاطئه');
      }
    } 
    return userCredential;
  }


  void storeUserInfoToFireStore({required UserInfoModel userModel}) async {
    Map<String, dynamic> userMap = userModel.toJson();
    await FirebaseFirestore.instance
        .collection(userInfoCollectionName)
        .doc(userModel.userId)
        .set(userMap);
  }

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

}
