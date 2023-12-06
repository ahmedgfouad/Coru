// ignore_for_file: avoid_print

import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/features/Authentication/view/view_model/auth_controller.dart';
import 'package:elearning_app/features/profile/view/views/widgets/profile_app_bar.dart';
import 'package:elearning_app/features/profile/view/views/widgets/profile_option.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {

Map<String, dynamic> optionInfo = {
    '0': [
      AppImages.profile,
       S.of(context).edit_profile,
      Routes.editProfile,
    ],
    '1': [
      AppImages.notification,
       S.of(context).notifications,
      Routes.notification,
    ],
    '2': [
      AppImages.localization,
       S.of(context).language,
      Routes.localization,
    ],
    '3': [
      AppImages.login,
       S.of(context).paymet_card,
      Routes.payment,
    ],
    '4': [
      AppImages.logo,
       S.of(context).privacy_policy,
      Routes.privacyPolicy,
    ],
    '5': [AppImages.login,  S.of(context).logout],
  };

    return Scaffold(
      body: Column(
        children: [
          const ProfileAppBarWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: optionInfo.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) => Consumer<AuthController>(
                        builder: (
                          BuildContext context,
                          AuthController provier,
                          Widget? child,
                        ) =>
                            ProfileOptionWidget(
                          iconImage: optionInfo[index.toString()][0],
                          optionName: optionInfo[index.toString()][1],
                          onTap: ()  {
                            if (index == 5) { 
                              provier.makeTextFormFieldEmpty(); 
                               provier.changeUserCurentState(
                                isGuest: false,
                              ); 
                              FirebaseAuth.instance.signOut();
                              AppRoutes.pushNamedNavigator(
                                replacement: true,
                                routeName: Routes.login,
                              );
                            } else {
                              AppRoutes.pushNamedNavigator(
                                routeName:optionInfo[index.toString()][2],
                              );
                            }
                          },
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
