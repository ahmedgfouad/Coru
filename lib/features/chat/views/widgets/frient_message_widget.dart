// ignore_for_file: must_be_immutable

import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/features/chat/data/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendMessageWidget extends StatelessWidget {
  MessageModel messageModel;
  FriendMessageWidget({Key? key, required this.messageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            EdgeInsets.only(top: 15.h, bottom: 15.h, left: 10.w, right: 10.w),
        decoration: const BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.only(
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
