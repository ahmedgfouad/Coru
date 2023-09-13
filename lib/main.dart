// ignore_for_file: unused_import

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:elearning_app/features/home/view/view/home_view.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'handlers/localization.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      builder: (context,child)=>MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ELearning App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
       initialRoute: Routes.signUp,
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
    ),
    );
  }
}
