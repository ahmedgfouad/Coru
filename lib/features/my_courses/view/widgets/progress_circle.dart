import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:flutter/material.dart';

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQueryHelper.height * .08,
          width: MediaQueryHelper.width * .17,
          child: CircularProgressIndicator(
            semanticsLabel: '50%',
            color: AppColors.primaryColor,
            backgroundColor: Colors.grey.shade400,
            strokeWidth: 9,
            value: .5,
            strokeAlign: -1,
          ),
        ),
        Positioned(
            bottom: MediaQueryHelper.height * .03,
            right: MediaQueryHelper.width * .04,
            child: Center(
              child: Text(
                '50%',
                style: TextStyle(
                   // color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ))
      ],
    );
  }
}
