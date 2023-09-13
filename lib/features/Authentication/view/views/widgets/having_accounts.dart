// ignore_for_file: must_be_immutable

import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:flutter/material.dart';

class HavingAccount extends StatelessWidget {
  String question;
  String screenName;
  String routeScreenName;
  HavingAccount({
    super.key,
    required this.question,
    required this.screenName,
    required this.routeScreenName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          question,
          style:  TextStyle(
            color: AppColors.primaryColor,
            fontSize: 12,
          ),
        ),
        TextButton(
          child: Text(
            screenName,
            style:  TextStyle(
              color: AppColors.primaryColor,
              fontSize: 14,
            ),
          ),
          onPressed: () {
            AppRoutes.pushNamedNavigator(
              replacement: true,
              routeName: routeScreenName,
            );
          },
        ),
      ],
    );
  }
}
