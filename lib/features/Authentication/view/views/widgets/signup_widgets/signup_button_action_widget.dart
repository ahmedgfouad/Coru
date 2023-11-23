// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/features/Authentication/view/view_model/auth_controller.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpButtonActionWidget extends StatelessWidget {
  const SignUpButtonActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (
        BuildContext context,
        AuthController provider,
        Widget? child,
      ) =>
          DefaultButton(
        onPressed: () async {
          await provider.signUpAuth();
          if (provider.userCredential != null) {
            await provider.storeUserDataToFireStor();
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
      ),
    );
  }
}
