import 'dart:developer';

import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/Authentication/view/view_model/auth_controller.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<AuthController>(
        builder: (
          BuildContext context,
          provider,
          Widget? child,
        ) {
          log("The staues user is guest : ${provider.isGuest}");
          return Container(
            width: 390,
            height: 176,
            decoration: const BoxDecoration(
              color: AppColors.thirdColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
            ),
            child: provider.isGuest
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        radius: 23.r,
                        child: CircleAvatar(
                          radius: 22.r,
                          backgroundImage: const AssetImage(AppImages.avatar),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "As a Guest",
                        style: AppStyles.textStyle18,
                      ),
                    ],
                  )
                : StreamBuilder(
                    stream: Provider.of<EditProfileController>(context,
                            listen: false)
                        .getUserDataById()
                        .asStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        UserInfoModel? userData = snapshot.data;
                        return Row(
                          children: [
                            SizedBox(width: 50.w),
                            userData!.imageProfileUrl != null
                                ? CircleAvatar(
                                    radius: 22.r,
                                    backgroundImage: NetworkImage(
                                      userData.imageProfileUrl.toString(),
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: AppColors.primaryColor,
                                    radius: 23.r,
                                    child: CircleAvatar(
                                      radius: 22.r,
                                      backgroundImage:
                                          const AssetImage(AppImages.avatar),
                                    ),
                                  ),
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${userData.firstName} ${userData.lasttName}",
                                  style: AppStyles.textStyle18,
                                ),
                                Text(
                                  "Astronaut",
                                  style: AppStyles.textStyle14.copyWith(
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      }
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
          );
        },
      ),
    );
  }
}
