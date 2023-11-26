import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CoursTitleAndSavedIconWidget extends StatelessWidget {
  const CoursTitleAndSavedIconWidget({
    super.key,
    required this.course,
  });

  final CourseDetailsModel course;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            course.name!,
            style: TextStyle(
              fontSize: 22.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.bookmark,
              width: MediaQuery.of(context).size.width * 0.04,
              height: MediaQuery.of(context).size.height * 0.04,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ))
      ],
    );
  }
}
