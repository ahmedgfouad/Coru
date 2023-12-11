import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = const Color(0xff377175).withOpacity(.9);
  static Color secondaryColor = const Color(0xff80CBC4).withOpacity(.7);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color thirdColor = Color(0xFFddefe3);
  static const Color grey = Color(0xFF888888);
  static const Color curvePrimary = Color(0xFF5E5AFF);
  static const Color curveSecondary = Color(0xFF804EEB);
}

class AppTheme {
  ThemeData lightTheme = ThemeData(
    indicatorColor: const Color(0xff377175).withOpacity(.9),
    iconTheme: const IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: const Color(0xff377175).withOpacity(.9),
      secondary: const Color(0xff80CBC4).withOpacity(.7),
      background: Colors.black,
      brightness: Brightness.light,
      primaryContainer: Colors.white,
      secondaryContainer: const Color(0xff377175).withOpacity(.9),
    ),
  );
  ThemeData darkTheme = ThemeData(
    indicatorColor: const Color(0xff377175).withOpacity(.9),
    scaffoldBackgroundColor: const Color(0xff181A20),
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark(
      background: Colors.white,
      primaryContainer: Color(0xff1F222A),
      primary: Color.fromARGB(255, 73, 164, 151),
      secondary: Color.fromARGB(255, 76, 141, 116),
      brightness: Brightness.dark,
      secondaryContainer: Color.fromARGB(255, 98, 180, 188),
    ),
  );
}
