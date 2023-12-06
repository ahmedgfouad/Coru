import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/features/cart/view/view_model/cart_controller.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CoursePriceAndAddToCardButtonWidget extends StatelessWidget {
  const CoursePriceAndAddToCardButtonWidget({
    super.key,
    required this.course,
  });

  final CourseDetailsModel course;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${course.price!}',
          style: TextStyle(
            fontSize: 30.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        DefaultButton(
          borderRadius: 10,
          text:  S.of(context).add_to_cart,
          backgroundColor: AppColors.primaryColor,
          width: MediaQueryHelper.width * .4,
          height: MediaQueryHelper.height * .05,
          onPressed: () {
            Provider.of<CartController>(context,
                    listen: false)
                .addCourse(course);
            Provider.of<CartController>(context,
                    listen: false)
                .getTotal();
            Navigator.pop(context, true);
          },
        )
      ],
    );
  }
}
