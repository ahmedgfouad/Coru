// ignore_for_file: unused_local_variable, avoid_print

import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/features/Authentication/view/view_model/guest_controller.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupAsGuestWidget extends StatelessWidget {
  const SignupAsGuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserCredential userCredential;
    return Center(
      child: Consumer<UserGusetController>(
        builder: (
          BuildContext context,
          UserGusetController provider,
          Widget? child,
        ) =>
            TextButton(
          onPressed: () async {
            userCredential = await FirebaseAuth.instance.signInAnonymously();
            await provider.changeCurentState();
            print("in user guest widget and isguest = ${provider.isGuest}");
            AppRoutes.pushNamedNavigator(
              routeName: Routes.navBar,
            );
          },
          child: Text(
            "As a Guest",
            style: AppStyles.textStyle18.copyWith(
              color: AppColors.curvePrimary,
            ),
          ),
        ),
      ),
    );
  }
}
