import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: MediaQueryHelper.height * .2),
      SvgPicture.asset(
        AppImages.emptyCart,
        height: 250,
      ),
      SizedBox(
        height: MediaQueryHelper.height * .02,
      ),
      Center(
        child: Text(S.of(context).no_courses_in_cart),
      ),
    ]);
  }
}
