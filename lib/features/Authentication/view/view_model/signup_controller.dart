// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  static final GlobalKey<FormState> formStat = GlobalKey();

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

  signUpAuth(String email, String password) async {
    var formData = formStat.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      // print("The user UID = ${userCredential.user!.uid}");
    } else {
      print("Not Validate");
    }
  }
}
