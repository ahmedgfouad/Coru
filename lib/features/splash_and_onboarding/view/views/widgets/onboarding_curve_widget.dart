import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingCurveWidget extends StatelessWidget {
  const OnboardingCurveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.avatar,
          cacheHeight: 130.h.toInt(),
          cacheWidth: MediaQuery.of(context).size.width.toInt(),
          opacity: const AlwaysStoppedAnimation(0),
        ),
         Positioned(
          left: 0,
          top: -250,
          child: CircleAvatar(
            radius: 170,
            backgroundColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
