import 'package:elearning_app/features/Authentication/view/views/login_view.dart';
import 'package:elearning_app/features/Authentication/view/views/signup_view.dart';
import 'package:elearning_app/features/chat/views/chat_view.dart';
import 'package:elearning_app/features/chat/views/header_chats_view.dart';

import 'package:elearning_app/features/home/view/views/course_categories_view.dart';

import 'package:elearning_app/features/home/view/views/home_view.dart';
import 'package:elearning_app/features/my_courses/view/views/my_courses_view.dart';
import 'package:elearning_app/features/nav_bar/view/views/nav_bar_view.dart';
import 'package:elearning_app/features/notification/view/views/notefication_view.dart';
import 'package:elearning_app/features/payment/views/payment_view.dart';
import 'package:elearning_app/features/profile/view/views/edit_profile_view.dart';
import 'package:elearning_app/features/profile/view/views/localization_view.dart';
import 'package:elearning_app/features/profile/view/views/privacy_view.dart';
import 'package:elearning_app/features/profile/view/views/profile_view.dart';
import 'package:elearning_app/features/search/view/views/search_view.dart';
import 'package:elearning_app/features/splash_and_onboarding/view/views/onboarding_view.dart';
import 'package:elearning_app/features/splash_and_onboarding/view/views/splash_view.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingView());

      case Routes.signUp:
        return AppRoutes.aniamtedNavigation(screen: const SignupView());

      case Routes.login:
        return AppRoutes.aniamtedNavigation(screen: const LoginView());

      case Routes.navBar:
        return AppRoutes.aniamtedNavigation(screen: const NavBarView());

      case Routes.home:
        return AppRoutes.aniamtedNavigation(screen: const HomeView());

      case Routes.profile:
        return AppRoutes.aniamtedNavigation(screen: const ProfileView());

      case Routes.editProfile:
        return AppRoutes.aniamtedNavigation(screen: const EditProfileView());

      case Routes.notification:
        return AppRoutes.aniamtedNavigation(screen: const NotificationView());

      case Routes.localization:
        return AppRoutes.aniamtedNavigation(screen: const LocalizationView());

      case Routes.payment:
        return AppRoutes.aniamtedNavigation(screen: const PaymentCardView());

      case Routes.privacyPolicy:
        return AppRoutes.aniamtedNavigation(screen: const PrivacyPolicyViwe());

      case Routes.search:
        return AppRoutes.aniamtedNavigation(screen: const SearchView());

      case Routes.headerChat:
        return AppRoutes.aniamtedNavigation(screen: const HeaderChatsView());

      case Routes.chat:
        return AppRoutes.aniamtedNavigation(screen: ChatView());

      case Routes.myCourses:
        return AppRoutes.aniamtedNavigation(screen: const MyCoursesView());
      case Routes.coursesCategories:
        return AppRoutes.aniamtedNavigation(
            screen:
                CoursesCategoriesView(category: settings.arguments as String));

      default:
        return AppRoutes.aniamtedNavigation(
            screen: const Scaffold(
          body: Center(child: Text('Error')),
        ));
    }
  }

  static aniamtedNavigation({
    required Widget screen,
  }) {
    return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
    );
  }

  static pushNamedNavigator({
    required String routeName,
    Object? arguments,
    bool replacement = false,
  }) {
    if (replacement) {
      navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      navigatorState.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }
}
