// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, avoid_function_literals_in_foreach_calls

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/chat/data/chat_model.dart';
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

  Future<void> updateUserInfoOnFireStore(
      {required UserInfoModel userModel}) async {
    String docId = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> userMap = userModel.toJson();
    await allUsersInfo.doc(docId).update(userMap);
  }

  Future<List<UserInfoModel>> getAllUsersInfo() async {
    String curentUserUid = FirebaseAuth.instance.currentUser!.uid;

    List<UserInfoModel> listOfAllUsersInof = [];
    QuerySnapshot querySnapshot = await allUsersInfo
        .where(useridField, isNotEqualTo: curentUserUid)
        .get();
    listOfAllUsersInof = querySnapshot.docs
        .map((e) => UserInfoModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return listOfAllUsersInof;
  }

  Future<UserInfoModel> getInfoOneUserById() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userInfo = await allUsersInfo.doc(userId).get();
    UserInfoModel userData = UserInfoModel.fromJson(
      userInfo.data() as Map<String, dynamic>,
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
    log('the image url in uploadding is : $imageUrl');

    return imageUrl;
  }

  ChatModel chatModel = ChatModel();
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('chat');
  List setOfUsersId = [];
  List bridge = [];
  String existStat = "";

  void addNewChat({
    required userId,
    required friendId,
  }) {
    bridge.clear();

    if (setOfUsersId.isEmpty) {
      chatModel.userId = userId;
      chatModel.friendId = friendId;
      setOfUsersId.add(chatModel);
      print("not exist and we add to list ");
      print(setOfUsersId.length);
      return;
    } else {
      for (int i = 0; i < setOfUsersId.length; i++) {
        if ((setOfUsersId[i].userId == userId ||
                setOfUsersId[i].friendId == userId) &&
            (setOfUsersId[i].userId == friendId ||
                setOfUsersId[i].friendId == friendId)) {
          print("in $i loop");
          print(" exist ");
          existStat = "exist";
        } else {
          existStat = "notExist";
        }
      }

      if (existStat == "notExist") {
        chatModel.userId = userId;
        chatModel.friendId = friendId;
        bridge.add(chatModel);
      }
    }
    setOfUsersId.add(bridge.first);
    print("====");
    print(setOfUsersId.length);
    for (int i = 0; i < setOfUsersId.length; i++) {
      print(setOfUsersId[i].friendId);
    }
    print("=======");

    existStat = "";
  }
}
  //   await FirebaseFirestore.instance.collection('chat').doc().set({
    //     'user_id': userId,
    //     'friend_id': friendId,
    //   });