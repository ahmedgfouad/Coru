import 'dart:developer';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/features/Authentication/view/view_model/auth_controller.dart';
import 'package:elearning_app/features/cart/view/view_model/cart_controller.dart';
import 'package:elearning_app/features/chat/views/view_model/chat_controller.dart';
import 'package:elearning_app/features/home/view/view_model/home_controller.dart';
import 'package:elearning_app/features/my_courses/view_model/my_courses_controller.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:elearning_app/features/profile/view/view_model/localization_controller.dart';
import 'package:elearning_app/features/profile/view/view_model/theme_controller.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

bool isLogIn = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var user = FirebaseAuth.instance.currentUser;
  log("======the user in main == ${user?.email}============");
  if (user == null) {
    log("in if ${user.toString()}");
    isLogIn = false;
  } else {
    log("in else ${user.toString()}");
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
            create: (context) => HomeController()
              ..getTopCourses()
              ..getRecentCourse(),
          ),
          ChangeNotifierProvider(
              create: (context) => MyCoursesController()..getUserCourses()),
          ChangeNotifierProvider(create: (context) => ThemeController()),
          ChangeNotifierProvider(create: (context) => LocalizationController()),
          ChangeNotifierProvider(create: (context) => EditProfileController()),
          ChangeNotifierProvider(create: (context) => CartController()),
          ChangeNotifierProvider(create: (context) => AuthController()),
          ChangeNotifierProvider(
            create: (context) => EditProfileController()..getUserDataById(),
          ),
          ChangeNotifierProvider(create: (context) => AuthController()),
          ChangeNotifierProvider(
            create: (context) => ChatController()..getallUsersInfo(),
          ),
          ChangeNotifierProvider(
            create: (context) => LocalizationController(),
          ),
        ],
        builder: (context, _) => Consumer<LocalizationController>(
          builder: (
            BuildContext context,
            LocalizationController provider,
            Widget? child,
          ) =>
              MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CORU',
            theme: AppTheme().lightTheme,
            darkTheme: AppTheme().darkTheme,
            themeMode:
                Provider.of<ThemeController>(context, listen: true).themeMode,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: isLogIn ? Routes.navBar : Routes.splash,
            navigatorKey: AppRoutes.navigatorState,
            navigatorObservers: [AppRoutes.routeObserver],
            scaffoldMessengerKey: AppRoutes.scaffoldState,
            locale:
                provider.index == 0 ? const Locale('en') : const Locale('ar'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          ),
        ),
      ),
    );
  }
}
