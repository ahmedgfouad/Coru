import 'package:elearning_app/core/widgets/vertical_course_card.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/features/home/view/view_model/home_controller.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RecentCourse extends StatelessWidget {
  const RecentCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) {
        if (value.recentCourse == null ||
            value.recentCourse == CourseDetailsModel()) {
          return Container();
        } else {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Course',
                    style: TextStyle(
                        fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {AppRoutes.pushNamedNavigator(routeName: Routes.myCourses);},
                    child: Text('See all',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              VerticalCourseCard(
                course: value.recentCourse!,
                 /* index: value.index!, */
              ),
            ],
          );
        }
      },
    );
  }
}
