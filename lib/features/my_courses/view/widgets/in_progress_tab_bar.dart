import 'dart:developer';

import 'package:elearning_app/core/widgets/vertical_course_card.dart';
import 'package:elearning_app/features/my_courses/view_model/my_courses_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InProgressTabBar extends StatelessWidget {
  const InProgressTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<MyCoursesController>(
        builder: (context, value, child) {
          if (value.myCoursesProgress == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: List.generate(
                value.myCoursesProgress!.length,
                (index) {
                  log('$value.myCoursesProgress');
                  return VerticalCourseCard(
                    isProgress: true,
                    course: value.myCoursesProgress![index],
                    /* index: 1, */
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
