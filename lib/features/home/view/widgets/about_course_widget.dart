import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AbouteCourseWidget extends StatelessWidget {
  const AbouteCourseWidget({
    super.key,
    required this.course,
  });

  final CourseDetailsModel course;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).about,
          style: TextStyle(
            fontSize: 22.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(course.about!),
      ],
    );
  }
}
