import 'package:elearning_app/core/utilities/colors.dart';
import 'package:flutter/material.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          // '${getLang(context, 'forget password ?')}',
          "forget password ?",
          style: TextStyle(
            fontSize: 13,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
