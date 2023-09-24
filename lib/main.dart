// ignore_for_file: unused_import, await_only_futures

import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/features/Authentication/view/view_model/guest_controller.dart';
import 'package:elearning_app/features/cart/view/views/cart_view.dart';
import 'package:elearning_app/features/home/view/views/course_details_view.dart';
import 'package:elearning_app/features/home/view/views/home_view.dart';
import 'package:elearning_app/features/home/view_model/home_controller.dart';
import 'package:elearning_app/features/my_courses/view_model/my_courses_controller.dart';
import 'package:elearning_app/features/profile/view/view_model/localization_controller.dart';
import 'package:elearning_app/features/profile/view/view_model/profile_controller.dart';
import 'package:elearning_app/features/profile/view/view_model/theme_controller.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'handlers/localization.dart';

bool isLogIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var user = await FirebaseAuth.instance.currentUser;
  // print("======the user in main == ${user!.email}============");
  if (user == null) {
    isLogIn = false;
  } else {
    isLogIn = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
              //remove getCourses after finishing myCourses view
              create: (context) => HomeController()
                ..getTopCourses()
                ..getCourses(courseFilter: "All courses")
                ..getRecentCourse()),
          ChangeNotifierProvider(
              create: (context) => MyCoursesController()..getUserCourses()),
          ChangeNotifierProvider(create: (context) => ThemeController()),
          ChangeNotifierProvider(create: (context) => LocalizationController()),
          ChangeNotifierProvider(create: (context) => UserGusetController()),
        ],
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ELearning App',
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          themeMode:
              Provider.of<ThemeController>(context, listen: true).themeMode,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          //home:CartView(),
          initialRoute: isLogIn ? Routes.navBar : Routes.splash,
          navigatorKey: AppRoutes.navigatorState,
          navigatorObservers: [AppRoutes.routeObserver],
          scaffoldMessengerKey: AppRoutes.scaffoldState,
          localizationsDelegates: const [
            AppLocale.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('ar', ''), // Arabic, no country code
          ],
          localeResolutionCallback: (currentLocales, supportedLocales) {
            if (currentLocales != null) {
              for (Locale locale in supportedLocales) {
                /*  if (supportedLocales.contains(locale)) {
              return locale;
            } */
                if (locale.languageCode == currentLocales.languageCode) {
                  return locale;
                }
              }
            }
            return supportedLocales.first;
          },
          locale:
              Provider.of<LocalizationController>(context, listen: true).local,
          // home: CourseDetailsView(course: CourseDetailsModel()),
        ),
      ),
    );
  }
}
