import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/features/Authentication/view/view_model/login_controller.dart';
import 'package:elearning_app/features/Authentication/view/view_model/signup_controller.dart';
import 'package:elearning_app/features/profile/view/views/widgets/profile_option.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> optionInfo = {
      '0': [
        AppImages.profile,
        // S.of(context).edit_profile,
        // const EditProfileScreen()
      ],
      '1': [
        AppImages.notification,
        // S.of(context).notifications,
        // const NotificationsScreen()
      ],
      '2': [
        AppImages.localization,
        // S.of(context).language,
        // const ChooseLanguageScreen()
      ],
      '6': [
        AppImages.localization,
        // S.of(context).add_new_course,
        // AddNewCourseScreen(),
      ],
      '3': [
        AppImages.programming,
        // S.of(context).payment_card,
        // const PaymentCardScreen()
      ],
      '4': [
        AppImages.profile,
        // S.of(context).privacy_policy,
        // const PrivacyPolicyScreen()
      ],
      // '5': [AppImages.logOut, S.of(context).logout],
    };
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          // const ProfileBarWidget(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 15.h, left: 20.w, right: 20.w),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: optionInfo.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) => ProfileOptionWidget(
                  iconImage: optionInfo[index.toString()][0],
                  optionName: optionInfo[index.toString()][1],
                  onTap: () {
                    if (index == 5) {
                      LogInController().makeTextFormFieldEmpty();
                      SignUpController().makeTextFormFieldEmpty();

                      FirebaseAuth.instance.signOut();
                      
                    } else {
                      // defaultNavigator(
                      //     context, optionInfo[index.toString()][2]);
                    }
                  },
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

/*
                delete the account

                     try {
                  await FirebaseAuth.instance.currentUser!.updateEmail('newEmail');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'requires-recent-login') {
                    print('The user must reauthenticate before this operation can be executed.');
                  }
                }
*/
