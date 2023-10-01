import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class UserServices {
  var ref;
  var imageUrl;
  CollectionReference allUsersInfo =
      FirebaseFirestore.instance.collection(userInfoCollectionName);
  UserInfoModel userModel = UserInfoModel();

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
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
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

  Future<void> updateUserInfoOnFireStore({required UserInfoModel userModel}) async {
    String docId = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> userMap = userModel.toJson();
    await allUsersInfo.doc(docId).update(userMap);
  }

  Future<List<UserInfoModel>> getAllInfoFromUsers() async {
    List<UserInfoModel> listOfUsersInof = [];
    QuerySnapshot querySnapshot = await allUsersInfo.get();
    listOfUsersInof = querySnapshot.docs
        .map((e) => UserInfoModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return listOfUsersInof;
  }

  Future<UserInfoModel> getInfoOneUserById() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userInfo = await allUsersInfo.doc(userId).get();
    UserInfoModel userData = UserInfoModel.fromJson(
      userInfo.data() as Map<String, dynamic>,
    );
    return userData;
  }

  Future<UserInfoModel> searchForUserByName({
    required String nameOfUser,
  }) async {
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

  Future<String> uploadingImageToFireStorage() async {
    DateTime date = DateTime.now();

    ref = FirebaseStorage.instance.ref("$date");

    await ref.putFile(EditProfileController.file);
    imageUrl = await ref.getDownloadURL();
    print('the image url in uploadding is : $imageUrl');

    return imageUrl;
  }
}
