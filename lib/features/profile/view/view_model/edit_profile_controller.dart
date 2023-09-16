// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends ChangeNotifier {

  static var imageUrl;
  static var ref;
  static File? file;

  CollectionReference profileInfoReference =
      FirebaseFirestore.instance.collection(userInfoCollectionName);

  editProfile(
    var docId,
    String firstName,
    String lastName,
    String email,
    String password,
    String confirmPassword,
  ) {
    profileInfoReference.doc(docId).update({
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    });
  }

  static bool obSecurePassword = true;
  static bool obSecureConfirmPassword = true;

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
}
