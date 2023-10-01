import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primaryColor,
      radius: 23.r,
      child: FutureBuilder(
        future: Provider.of<EditProfileController>(context, listen: false)
            .getUserDataById(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasData) {
            UserInfoModel userData = snapshot.data;
            String? imageProfileUrl = userData.imageProfileUrl;
            try {
              return CircleAvatar(
                radius: 22.r,
                backgroundImage: NetworkImage(imageProfileUrl!),
              );
            } catch (e) {
              return CircleAvatar(
                radius: 22.r,
                backgroundImage: const AssetImage(AppImages.avatar),
              );
            }
          }
          if (snapshot.hasError) {
            return CircleAvatar(
              radius: 22.r,
              backgroundImage: const AssetImage(AppImages.avatar),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
