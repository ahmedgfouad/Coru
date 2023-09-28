// ignore_for_file: unnecessary_null_comparison

import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/features/Authentication/view/view_model/auth_controller.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/accounts_icons.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/forget_password_widget.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/having_accounts.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/login_widgets/login_botton_action_widget.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/login_widgets/login_email_form_field_widget.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/login_widgets/login_password_form_field_widget.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/*
ahmedgamal@gmail.com
123456789 


*/

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: AuthController.formStat,
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
                  const LoginEmailFormFieldWidget(),
                  const SizedBox(height: 20),
                  const LoginPasswordFormFieldWidget(),
                  const SizedBox(height: 10),
                  const ForgetPasswordWidget(),
                  const SizedBox(height: 10),
                  const LoginButtonActionWidget(),
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
    );
  }
}
