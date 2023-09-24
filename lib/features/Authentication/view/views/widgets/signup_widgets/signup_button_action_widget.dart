// ignore_for_file: unnecessary_null_comparison

import 'dart:developer'; 
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/features/Authentication/view/view_model/signup_controller.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpButtonActionWidget extends StatelessWidget {
  const SignUpButtonActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onPressed: () async {
        UserCredential response = await SignUpController().signUpAuth(); 
        if (response != null) {
          String userid = FirebaseAuth.instance.currentUser!.uid;
          SignUpController().storeUserInfoToFireStore(userId: userid);
          AppRoutes.pushNamedNavigator(
            replacement: true,
            routeName: Routes.navBar,
          );
        } else {
          log("is null");
        }
      },
      width: 300,
      height: 45,
      backgroundColor: AppColors.primaryColor,
      text: "SignUp",
      borderRadius: 15,
    );
  }
}
