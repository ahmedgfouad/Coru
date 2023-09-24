import 'dart:developer';

import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/features/Authentication/view/view_model/logIn_controller.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginButtonActionWidget extends StatelessWidget {
  const LoginButtonActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultButton(
                      onPressed: () async {
                        UserCredential response =
                            await LogInController().loginAuth(
                          LogInController.emailController.text,
                          LogInController.passwordController.text,
                        );
                        log("=========");
                        if (response != null) {
                          AppRoutes.pushNamedNavigator(
                            replacement: true,
                            routeName: Routes.navBar,
                          );
                        } else {
                          log("eroor");
                        }
                      },
                      width: 300,
                      height: 45,
                      backgroundColor: AppColors.primaryColor,
                      text: "Log in",
                      borderRadius: 15,
                    );
  }
}