// ignore_for_file: use_build_context_synchronously

import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfilePictureWidger extends StatelessWidget {
  const ProfilePictureWidger({
    super.key,
    required this.userData,
  });

  final UserInfoModel? userData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          radius: 32,
          child: userData!.imageProfileUrl != null
              ? CircleAvatar(
                  radius: 30.w,
                  backgroundImage: NetworkImage(
                    "${userData!.imageProfileUrl}",
                  ),
                )
              : CircleAvatar(
                  radius: 26.w,
                  backgroundImage: const AssetImage(
                    AppImages.avatar,
                  ),
                ),
        ),
        Positioned(
          right: -15,
          top: 20.h,
          child: IconButton(
            onPressed: () async {
              await Provider.of<EditProfileController>(context, listen: false)
                  .takeImage();
              await Provider.of<EditProfileController>(context, listen: false)
                  .uploadingImageToFireStorage();
            },
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
