import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/features/home/view/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CoursTitleAndBookMarkIconWidget extends StatefulWidget {
  const CoursTitleAndBookMarkIconWidget({
    super.key,
    required this.course,
  });

  final CourseDetailsModel course;

  @override
  State<CoursTitleAndBookMarkIconWidget> createState() =>
      _CoursTitleAndBookMarkIconWidgetState();
}

class _CoursTitleAndBookMarkIconWidgetState
    extends State<CoursTitleAndBookMarkIconWidget> {
  bool isSaved = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            widget.course.name!,
            style: TextStyle(
              fontSize: 22.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Consumer<HomeController>(
          builder: (
            BuildContext context,
            HomeController provider,
            Widget? child,
          ) =>
              GestureDetector(
            onTap: () { 
              provider.savedCourseIdInBookMark();
              setState(() {
                isSaved = !isSaved;
              });
            },
            child: Icon(
              isSaved ? Icons.bookmark : Icons.bookmark_outline,
              size: 35,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
