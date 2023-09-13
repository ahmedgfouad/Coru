import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final String iconImage;
  final Function()? onPressed;
  const CustomIconButton({
    super.key,
    required this.iconImage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.r),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        radius: 19.5.r,
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              iconImage,
              width: MediaQuery.of(context).size.width * 0.03,
              height: MediaQuery.of(context).size.height * 0.03,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
