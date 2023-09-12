import 'package:elearning_app/core/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountsIcons extends StatelessWidget {
  // late final String connect;
  final void Function() onPressed;
  const AccountsIcons({
    super.key,
    // required this.connect,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: onPressed,
          child: SvgPicture.asset(
            AppImages.twitter,
            width: 30,
            height: 30,
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: SvgPicture.asset(
            AppImages.google,
            width: 30,
            height: 30,
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: SvgPicture.asset(
            AppImages.facebook,
            width: 30,
            height: 30,
          ),
        ),
      ],
    );
  }
}
