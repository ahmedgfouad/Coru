import 'package:flutter/material.dart';

class CoursesCategoriesView extends StatelessWidget {
  const CoursesCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          /* AlemniAppBar(
             title: 'Courses Categories',
           ), */
          Padding(
            padding: EdgeInsets.all(8.0),
            /* child: VerticalListView(
                 cardWidget: VerticalCourseCard(),
               ), */
          ),
        ],
      )),
    ));
  }
}
