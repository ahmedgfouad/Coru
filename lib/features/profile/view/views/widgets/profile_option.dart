// ignore_for_file: deprecated_member_use

import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:flutter_svg/flutter_svg.dart';

class ProfileOptionWidget extends StatelessWidget {
  final String iconImage;
  final String optionName;
  final Function() onTap;

  const ProfileOptionWidget({
    super.key,
    required this.iconImage,
    required this.optionName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    iconImage,
                    width: 22.w,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                   optionName,
                    style: AppStyles.textStyle16,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward,
                size: 20.sp,
              ),
            ],
          ),
          const Divider(
            color: AppColors.grey,
            thickness: .4,
          )
        ],
      ),
    );
  }
}
