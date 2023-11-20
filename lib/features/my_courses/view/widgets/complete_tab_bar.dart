import 'dart:developer';

import 'package:elearning_app/core/widgets/vertical_course_card.dart';
import 'package:elearning_app/features/my_courses/view_model/my_courses_controller.dart';
import 'package:elearning_app/features/home/view/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompleteTabBar extends StatelessWidget {
  const CompleteTabBar({super.key});

  @override
   Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeController>(context, listen: true);

    return SingleChildScrollView(
      child: Consumer<MyCoursesController>(
        builder: (context, value, child) {
          if (value.myCoursesComplete == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            homeProvider.getCourses(courseFilter: "All courses");
            return Column(
              children: List.generate(
                value.myCoursesComplete!.length,
                (index) {
                  for(var i in homeProvider.courses!){
                    if(i.id==value.myCoursesComplete![index].courseId){
                      homeProvider.userCompleteCourses.add(i);
                    }
                  }
                  log('$value.myCoursesComplete');
                  return VerticalCourseCard(
                    isProgress: true,
                    course: homeProvider.userCompleteCourses[index],
                    myCourse: value.myCoursesComplete![index],
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