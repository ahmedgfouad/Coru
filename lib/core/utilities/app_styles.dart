import 'package:elearning_app/routing/navigator.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static const textStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.normal,
  );

  static const textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  ///////
  static final textStyle16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Theme.of(AppRoutes.navigatorState.currentContext!).colorScheme.primary);
///////
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const textStyle10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
  );
}
