// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
   @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      AppRoutes.pushNamedNavigator(
        routeName: Routes.onboarding,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* SvgPicture.asset(
                    AppImages.logo,
                    height: 70,
                    width: 70,
                  ), */
                  SizedBox(
                    height: MediaQueryHelper.height * .06,
                  ),
                  Image.asset(AppImages.coru,
                      height: MediaQueryHelper.height * .5,
                      width: MediaQueryHelper.width * .5),
                ],
              ),
            ),
            Positioned(
              top: MediaQueryHelper.height * -.25,
              left: MediaQueryHelper.width * -.005,
              child: CircleAvatar(
                backgroundColor: AppColors.primaryColor/* .withOpacity(.9) */,
                radius: 200,
              ),
            ),
            Positioned(
              top: MediaQueryHelper.height * -.14,
              left: MediaQueryHelper.width * -.4,
              child: CircleAvatar(
                backgroundColor: AppColors.secondaryColor/* .withOpacity(.7) */,
                radius: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
