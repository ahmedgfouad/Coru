import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:flutter/material.dart';

class BuyNowButtonWidget extends StatelessWidget {
  const BuyNowButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      borderRadius: 10,
      text: 'Buy Now',
      backgroundColor: AppColors.primaryColor,
      width: MediaQueryHelper.width * .4,
      height: MediaQueryHelper.height * .05,
      onPressed: () {},
    );
  }
}

