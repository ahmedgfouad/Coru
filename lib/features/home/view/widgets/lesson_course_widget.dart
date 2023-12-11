import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/features/home/view/widgets/lessons_tab_bar.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonsCoursWidget extends StatelessWidget {
  const LessonsCoursWidget({
    super.key,
    required this.course,
  });

  final CourseDetailsModel course;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).lessons,
          style: TextStyle(
            fontSize: 22.0.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        LessonsListWidget(lesson: course.lessons!),
      ],
    );
  }
}
