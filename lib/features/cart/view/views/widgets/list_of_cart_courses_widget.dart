// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/vertical_course_card.dart';
import 'package:flutter/material.dart';

class ListOfCartCoursesWidget extends StatelessWidget {
  var provider;
  ListOfCartCoursesWidget({
    super.key,
    this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryHelper.height / 1.5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: provider.cartCourses.length,
        itemBuilder: (context, index) {
          return VerticalCourseCard(
            course: provider.cartCourses[index],
            cartOnPressed: () {
              provider.removeCourse(provider.cartCourses[index].id!);
            },
            isCart: true,
          );
        },
      ),
    );
  }
}
