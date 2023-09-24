// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/Authentication/view/view_model/logIn_controller.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/accounts_icons.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/forget_password_widget.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/having_accounts.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

/*
ahmedgamal@gmail.com
123456789


emadmagdy@gmail.com
123456789
*/

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => LogInController(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: LogInController.formStat,
                child: Column(
                  children: [
                    const Text(
                      "Lets get Started",
                      style: TextStyle(fontSize: 30),
                    ),
                    SvgPicture.asset(
                      AppImages.login,
                      width: 133,
                      height: 176,
                    ),
                    DefaultFormField(
                      tittle: "Email",
                      width: 300,
                      height: 45,
                      controller: LogInController.emailController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'You should enter email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Consumer<LogInController>(
                      builder: (BuildContext context, value, Widget? child) =>
                          DefaultFormField(
                        tittle: "Password",
                        width: 300,
                        height: 45,
                        controller: LogInController.passwordController,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'You should enter password';
                          }
                          return null;
                        },
                        suffix: LogInController.obSecure
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined,
                        isPassword: true,
                        obSecure: LogInController.obSecure,
                        suffixButtonPressed: () {
                          value.changeObSecure();
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const ForgetPasswordWidget(),
                    const SizedBox(height: 10),
                    DefaultButton(
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
                    ),
                    HavingAccount(
                      question: "Have an account ?",
                      screenName: "Sign Up",
                      routeScreenName: Routes.signUp,
                    ),
                    AccountsIcons(onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
