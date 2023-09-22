import 'package:elearning_app/core/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 38.h,
        width: 43.w,
        child: CircularProgressIndicator(semanticsLabel: '50%',
          color: AppColors.primaryColor,
          backgroundColor: Colors.grey,
          strokeWidth: 7,
          value: .5,strokeAlign: 2 ,
        ),
      ),
      Stack(
        children:[ Positioned(
           bottom: 14.h,
          right: 10.w,
          child: Center(
            child: Text(
              '50%',
              style: TextStyle(color: AppColors.primaryColor, fontSize: 16),
            ),
          ),
        ),]
      )
    ]);
  }
}