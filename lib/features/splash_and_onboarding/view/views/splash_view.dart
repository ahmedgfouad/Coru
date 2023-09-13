// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
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
                  SvgPicture.asset(
                    AppImages.logo,
                    height: 70,
                    width: 70,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -200,
              left: -20,
              child: CircleAvatar(
                backgroundColor: AppColors.curvePrimary.withOpacity(.7),
                radius: 180,
              ),
            ),
            Positioned(
              top: -150,
              left: -200,
              child: CircleAvatar(
                backgroundColor: AppColors.curveSecondary.withOpacity(.5),
                radius: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
