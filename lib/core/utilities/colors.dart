
import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor =  const /* Color.fromRGBO(0, 105, 92, 1) */Color(0xff377175).withOpacity(.9);
  static Color secondaryColor =  const /* Color.fromRGBO(128, 203, 196, 1) */Color(0xff80CBC4).withOpacity(.7);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color thirdColor = Color(0xFFddefe3);
  static const Color grey = Color(0xFF888888);
  static const Color curvePrimary = Color(0xFF5E5AFF);
  static const Color curveSecondary = Color(0xFF804EEB);
}

class AppTheme {
  ThemeData lightTheme = ThemeData(
    indicatorColor:const Color(0xff377175).withOpacity(.9) ,
    iconTheme: const IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: const Color(0xff377175).withOpacity(.9),
      secondary: const Color(0xff80CBC4).withOpacity(.7),
      background: Colors.black,
      brightness: Brightness.light,
      primaryContainer: Colors.white,
      secondaryContainer: const Color(0xff80CBC4).withOpacity(.7),
    ),
  );
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff181A20),
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark(
      background: Colors.white,
      primaryContainer: Color(0xff1F222A),
      primary: Color.fromARGB(255, 137, 103, 211),
      secondary: Color(0xffBBA5FB) /* .withOpacity(.2), */,
      brightness: Brightness.dark,
      // background: Colors.
    ),
  );
}
/*
2A484E
377375
ABD8CD 
DDEFE3


البنفسجي القديم 
Color(0xff804EEB).withOpacity(.75)
Color(0xffBBA5FB).withOpacity(.2)

*/


