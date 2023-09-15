// ignore_for_file: use_build_context_synchronously, avoid_print, unused_import, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/core/widgets/dfault_text_form_field.dart';
import 'package:elearning_app/features/Authentication/view/view_model/signup_controller.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/accounts_icons.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/having_accounts.dart';
import 'package:elearning_app/features/home/view/views/home_view.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => SignUpController(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: SignUpController.formStat,
              child: Column(
                children: [
                  const Text(
                    "Lets get Started",
                    style: TextStyle(fontSize: 30),
                  ),
                  SvgPicture.asset(AppImages.login, width: 133, height: 176),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultFormField(
                          tittle: "First name",
                          width: 130,
                          height: 45,
                          controller: SignUpController.firstNameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'You should enter first name';
                            }
                            return null;
                          }),
                      DefaultFormField(
                          tittle: "Last name",
                          width: 130,
                          height: 45,
                          controller: SignUpController.lastNameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'You should enter last name';
                            }
                            return null;
                          }),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DefaultFormField(
                      tittle: "Email",
                      width: 300,
                      height: 45,
                      controller: SignUpController.emailController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'You should enter email';
                        }
                        return null;
                      }),
                  const SizedBox(height: 20),
                  Consumer<SignUpController>(
                    builder: (BuildContext context, value, Widget? child) =>
                        DefaultFormField(
                      tittle: "Password",
                      width: 300,
                      height: 45,
                      controller: SignUpController.passwordController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'You should enter password';
                        }
                        return null;
                      },
                      suffix: SignUpController.obSecurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                      isPassword: true,
                      obSecure: SignUpController.obSecurePassword,
                      suffixButtonPressed: () {
                        value.changeObSecurePassword();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Consumer<SignUpController>(
                    builder: (BuildContext context, value, Widget? child) =>
                        DefaultFormField(
                      tittle: "Confirm Password",
                      width: 300,
                      height: 45,
                      controller: SignUpController.confirmPasswordController,
                      type: TextInputType.name,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'You should enter confirm password';
                        }
                        return null;
                      },
                      suffix: SignUpController.obSecureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye_outlined,
                      isPassword: true,
                      obSecure: SignUpController.obSecureConfirmPassword,
                      suffixButtonPressed: () {
                        value.changeObSecureConfirmPassword();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  DefaultButton(
                    onPressed: () async {
                      UserCredential response =
                          await SignUpController().signUpAuth(
                        SignUpController.emailController.text,
                        SignUpController.passwordController.text,
                      );
                      print("==========");
                      if (response != null) {
                        print('++++++++++++++++++++++++++++++++++++');
                        await FirebaseFirestore.instance
                            .collection('user_info')
                            .add({
                          "first_name":
                              SignUpController.firstNameController.text,
                          "last_name": SignUpController.lastNameController.text,
                          "email": SignUpController.emailController.text,
                          "password": SignUpController.passwordController.text,
                          "confirm_password":
                              SignUpController.confirmPasswordController.text,
                          "user_id": FirebaseAuth.instance.currentUser!.uid,
                        });
                        // defaultNavigator(context, const HomeView());
                        AppRoutes.pushNamedNavigator(
                          routeName: Routes.navBar,
                        );
                      } else {
                        print("is null");
                      }
                    },
                    width: 300,
                    height: 45,
                    backgroundColor: AppColors.primaryColor,
                    text: "SignUp",
                    borderRadius: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HavingAccount(
                        question: "Have account",
                        screenName: "Login ",
                        routeScreenName: Routes.login,
                      ),
                    ],
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
