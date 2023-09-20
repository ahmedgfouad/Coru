import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/core/widgets/vertical_course_card.dart';
import 'package:elearning_app/features/home/view_model/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CoursesCategoriesView extends StatelessWidget {
  final String category;
  const CoursesCategoriesView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child:
          //To Do : see the overflow error
          Consumer<HomeController>(builder: (context, value, child) {
        if (value.courses != null) {
          return Column(
            children: [
              DefaultAppBar(title: category),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0.r),
                  itemBuilder: (context, index) {
                    
                    return VerticalCourseCard(
                        course: value.courses![index], index: index);
                  },
                  itemCount: value.courses!.length,
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    ));
  }
}
