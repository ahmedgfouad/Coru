// ignore_for_file: unused_import

import 'package:elearning_app/features/Authentication/view/view_model/guest_controller.dart';
import 'package:elearning_app/features/home/view/view/home_view.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
          ChangeNotifierProvider(create: (context) => UserGusetController()),
        ],
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ELearning App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: isLogIn ? Routes.navBar : Routes.splash,
          navigatorKey: AppRoutes.navigatorState,
          navigatorObservers: [AppRoutes.routeObserver],
          scaffoldMessengerKey: AppRoutes.scaffoldState,
        ),
      ),
    );
  }
}
