import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  static final GlobalKey<FormState> formStat = GlobalKey();

  UserInfoModel userInfoModel = UserInfoModel();

  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();

  static bool obSecurePassword = true;
  static bool obSecureConfirmPassword = true;

  changeObSecurePassword() {
    obSecurePassword = !obSecurePassword;
    notifyListeners();
  }

  makeTextFormFieldEmpty() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    notifyListeners();
  }

  changeObSecureConfirmPassword() {
    obSecureConfirmPassword = !obSecureConfirmPassword;
    notifyListeners();
  }

  signUpAuth() async {
    var formData = formStat.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
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
      // print("The user UID = ${userCredential.user!.uid}");
    } else {
      print("Not Validate");
    }
  }

  void storeUserInfoToFireStore({required String userId}) async {
    await FirebaseFirestore.instance
        .collection(userInfoCollectionName)
        .doc(userId)
        .set({
      firstNameField: firstNameController.text,
      lastNameField: lastNameController.text,
      emailField: emailController.text,
      passwordField: passwordController.text,
      confirmPasswordField: confirmPasswordController.text,
      useridField: userId,
      imageProfiledField: '',
      myCoursekField: '',
      bookMarkField: '',
    });
  }
}
