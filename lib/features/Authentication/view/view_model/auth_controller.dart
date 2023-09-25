import 'dart:developer';

import 'package:elearning_app/data/model/users_info/my_course_model.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/data/network/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  static final GlobalKey<FormState> formStat = GlobalKey();

  UserInfoModel userModel = UserInfoModel();
  UserServices userServices = UserServices();

  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();

  static bool obSecurePassword = true;
  static bool obSecureConfirmPassword = true;

  UserCredential? userCredential;

  bool isGuest = false;

  changeCurentState() {
    isGuest = !isGuest;
    notifyListeners();
  }

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
      userCredential = await userServices.signupServices(
        email: emailController.text,
        password: passwordController.text,
      );
    } else {
      log("Not Validate");
    }
    notifyListeners();
  }

  loginAuth() async {
    var formData = formStat.currentState;
    if (formData!.validate()) {
      formData.save();
      userCredential = await userServices.loginServices(
        email: emailController.text,
        password: passwordController.text,
      );
    } else {
      log("Not Valid");
    }
  }

  storeUserDataToFireStor() {
    userModel.firstName = firstNameController.text;
    userModel.lasttName = lastNameController.text;
    userModel.email = emailController.text;
    userModel.password = passwordController.text;
    userModel.cofirmPassword = confirmPasswordController.text;
    userModel.bookMark = <String>[];
    userModel.myCourses = <MyCourseModel>[];
    userModel.userId = userCredential!.user!.uid;
    userServices.storeUserInfoToFireStore(userModel: userModel);
  }
}
