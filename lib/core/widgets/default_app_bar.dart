import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/custom_icon_button.dart';
import 'package:elearning_app/core/widgets/profile_picture_widget.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBar extends StatelessWidget {
  final bool isHome;
  final String? title;
  const DefaultAppBar({super.key, this.isHome = false, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.r),
      child: Stack(
        children: [
          Positioned(
            top: 9,
            left: -22,
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 14.r,
            ),
          ),
          isHome
              ? Row(
                  children: [
                    SizedBox(width: MediaQueryHelper.width * 0.04),
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 4.r,
                    ),
                    SizedBox(width: MediaQueryHelper.width * 0.02),
                    const ProfilePictureWidget(),
                    const Spacer(),
                    CustomIconButton(
                      iconImage: AppImages.notification,
                      onPressed: () => AppRoutes.pushNamedNavigator(
                          routeName: Routes.notification),
                    ),
                    SizedBox(width: MediaQueryHelper.width * 0.02),
                    CustomIconButton(
                      iconImage: AppImages.bookmark,
                      onPressed: () => AppRoutes.pushNamedNavigator(
                          routeName: Routes.bookmarkedCourses),
                    ),
                    SizedBox(width: MediaQueryHelper.width * 0.02),
                    CustomIconButton(
                      iconImage: AppImages.search,
                      onPressed: () {
                        AppRoutes.pushNamedNavigator(routeName: Routes.search);
                      },
                    ),
                    SizedBox(width: MediaQueryHelper.width * 0.02),
                  ],
                )
              : Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 4,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
