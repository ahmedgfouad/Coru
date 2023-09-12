import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardOptionWidget extends StatelessWidget {
  String cardImage;
  String cardName;
  CardOptionWidget({Key? key, required this.cardImage, required this.cardName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 59.w,
                height: 51.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.secondary),
                child: Center(
                  child: SvgPicture.asset(
                    cardImage,
                    width: 40.w,
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                cardName,
                style: AppStyles.textStyle14,
              ),
            ],
          ),
          Text(
            'Online',
            style: AppStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
