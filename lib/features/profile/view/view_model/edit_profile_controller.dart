// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/data/network/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends ChangeNotifier {
  UserInfoModel? _userDataById;
  UserInfoModel? get userDataById => _userDataById;

  final UserServices _userInfoServices = UserServices();

  CollectionReference profileRef =
      FirebaseFirestore.instance.collection(userInfoCollectionName);

  static var imageUrl;
  static var ref;
  static File? file;

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;

  static bool obSecurePassword = true;
  static bool obSecureConfirmPassword = true;

  getUserDataById() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    _userDataById = await _userInfoServices.getInfoOneUserById(
      userId: userId,
    );
    notifyListeners();
  }

  void changeFirstName({required String firstName}) {
    this.firstName = firstName;
    notifyListeners();
  }

  void changeLastName({required String lastName}) {
    this.lastName = lastName;
    notifyListeners();
  }

  void changeEmail({required String email}) {
    this.email = email;
    notifyListeners();
  }

  void changePassword({required String password}) {
    this.password = password;
    notifyListeners();
  }

  void changeConfirmPassword({required String confirmPassword}) {
    this.confirmPassword = confirmPassword;
    notifyListeners();
  }

  changeObSecurePassword() {
    print("in change ob secure password method ");
    obSecurePassword = !obSecurePassword;
    notifyListeners();
  }

  changeObSecureConfirmPassword() {
    obSecureConfirmPassword = !obSecureConfirmPassword;
    notifyListeners();
  }

  takeImage() async {
    print("The first file is $file");
    var imagePicker = ImagePicker();
    var imgPicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imgPicked != null) {
      file = File(imgPicked.path);
      print("============$file=================");
    }
  }

  uploadingImageToFireStore() async {
    var randomImage = Random().nextInt(100);
    print(file);
    ref = FirebaseStorage.instance.ref("$randomImage x");
    print(randomImage);
    await ref.putFile(file);
    imageUrl = await ref.getDownloadURL();
    print(file);
    print("===========================");
    print(imageUrl);
  }

  void editProfile() async {
    var allDocs = await profileRef.get();
    var docId = allDocs.docs[1].id;
    print(allDocs.docs[0].id);
    print(docId);
  }

  // await userInfoRef
  //     .doc(snapShot.data!.docs[0].id)
  //     .update({
  //   'first_name': firstName,
  //   'last_name': lastName,
  //   'email': email,
  //   'password': password,
  //   'confirm_password': confirmPassword,
  // });

  // void editProfile(
  //   var docId,
  //   String firstName,
  //   String lastName,
  //   String email,
  //   String password,
  //   String confirmPassword,
  // ) {
  // profileRef.doc(docId).update({
  //   'first_name': firstName,
  //   'last_name': lastName,
  //   'email': email,
  //   'password': password,
  //   'confirm_password': confirmPassword,
  // });
  // }
}
