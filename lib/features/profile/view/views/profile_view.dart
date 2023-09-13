import 'package:elearning_app/core/widgets/profile_app_bar.dart';
import 'package:elearning_app/features/profile/view/view_model/profile_controller.dart';
import 'package:elearning_app/features/profile/view/views/widgets/profile_option.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProfileAppBarWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  itemCount: ProfileController().optionInfo.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) => ProfileOptionWidget(
                        iconImage:
                            ProfileController().optionInfo[index.toString()][0],
                        optionName:
                            ProfileController().optionInfo[index.toString()][1],
                        onTap: () {
                          if (index == 5) {
                            FirebaseAuth.instance.signOut();

                            AppRoutes.pushNamedNavigator(
                              replacement: true,
                              routeName: Routes.login,
                            );
                          } else {
                            AppRoutes.pushNamedNavigator(
                              routeName: ProfileController()
                                  .optionInfo[index.toString()][2],
                            );
                          }
                        },
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
