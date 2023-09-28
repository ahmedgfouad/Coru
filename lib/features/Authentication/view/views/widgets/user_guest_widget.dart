import 'dart:developer';

import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/features/Authentication/view/view_model/auth_controller.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupAsGuestWidget extends StatelessWidget {
  const SignupAsGuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<AuthController>(
        builder: (
          BuildContext context,
          AuthController provider,
          Widget? child,
        ) =>
            TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signInAnonymously();
            await provider.changeCurentState();
            log("in user guest widget and isguest = ${provider.isGuest}");
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
