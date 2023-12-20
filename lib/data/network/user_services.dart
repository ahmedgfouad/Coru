// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, avoid_function_literals_in_foreach_calls

// import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/chat/data/chat_model.dart';
import 'package:elearning_app/features/profile/view_model/edit_profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserServices {
  var ref;
  var imageUrl;
  CollectionReference allUsersInfo =
      FirebaseFirestore.instance.collection(userInfoCollectionName);
  String? userDocId;

  List<String> listOfCoursesDocIdsInBookMark = [];

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
      } else if (e.code == 'email-already-in-use') {}
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
      } else if (e.code == 'wrong-password') {}
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

  Future<void> updateUserInfoOnFireStore({
    required UserInfoModel userModel,
  }) async {
    String docId = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> userMap = userModel.toJson();
    await allUsersInfo.doc(docId).update(userMap);
  }

  Future<void> addCourseToBokMarkOnFirestore(course) async {
    String docId = FirebaseAuth.instance.currentUser!.uid;
    await allUsersInfo.doc(docId).set({"book_mark": course});
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
    return userInfo;
  }

  Future<String> uploadingImageToFireStorage() async {
    DateTime date = DateTime.now();

    ref = FirebaseStorage.instance.ref("$date");

    await ref.putFile(EditProfileController.file);
    imageUrl = await ref.getDownloadURL();

    return imageUrl;
  }

  Future<List<String>> addCourseInBookMark(String courseDocId) async {
    bool isCourseSaved = false;
    for (int i = 0; i < listOfCoursesDocIdsInBookMark.length; i++) {
      if (courseDocId == listOfCoursesDocIdsInBookMark[i]) {
        isCourseSaved = true;
      }
    }
    if (isCourseSaved == false) {
      listOfCoursesDocIdsInBookMark.add(courseDocId);
      userDocId = FirebaseAuth.instance.currentUser!.uid;
      await allUsersInfo.doc(userDocId).update({
        "book_mark": listOfCoursesDocIdsInBookMark,
      });
    } else {
      print("this course in list of saved");
    }

    return listOfCoursesDocIdsInBookMark;
  }

  Future<List<String>> deleteCourseFromBookMark(
      List<String> listOfCourses) async {
    listOfCoursesDocIdsInBookMark = listOfCourses;
    userDocId = FirebaseAuth.instance.currentUser!.uid;
    await allUsersInfo.doc(userDocId).update({
      "book_mark": listOfCourses,
    });

    return listOfCoursesDocIdsInBookMark;
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
