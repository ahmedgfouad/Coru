// ignore_for_file: must_be_immutable

import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/features/chat/data/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMessageWidget extends StatelessWidget {
  MessageModel messageModel;
  MyMessageWidget({Key? key, required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            EdgeInsets.only(top: 15.h, bottom: 15.h, left: 10.w, right: 10.w),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              messageModel.message,
              style: AppStyles.textStyle14.copyWith(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
