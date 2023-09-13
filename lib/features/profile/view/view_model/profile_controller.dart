import 'package:elearning_app/core/utilities/images.dart';
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
