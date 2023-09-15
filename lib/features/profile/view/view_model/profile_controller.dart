import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/features/notification/notefication_view.dart';
import 'package:elearning_app/features/payment/views/payment_view.dart';
import 'package:elearning_app/features/profile/view/views/edit_profile.dart';
import 'package:elearning_app/features/profile/view/views/localization_view.dart';
import 'package:elearning_app/features/profile/view/views/privacy_view.dart';
import 'package:elearning_app/routing/routes.dart';

class ProfileController {
  Map<String, dynamic> optionInfo = {
    '0': [
      AppImages.profile,
      "Edit profile",
      Routes.editProfile,
    ],
    '1': [
      AppImages.notification,
      "Notifications",
      Routes.notification,
    ],
    '2': [
      AppImages.localization,
      "Language",
      Routes.localization,
    ],
    '3': [
      AppImages.login,
      "Payment Card",
      Routes.payment,
    ],
    '4': [
      AppImages.logo,
      "Privacy Policy",
      Routes.privacyPolicy,
    ],
    '5': [AppImages.login, "Log out"],
  };
}
