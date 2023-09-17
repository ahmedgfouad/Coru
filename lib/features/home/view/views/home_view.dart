import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/features/home/view/widgets/course_categories_grid_view.dart';
import 'package:elearning_app/features/home/view/widgets/horizontal_course_list_view.dart';
import 'package:elearning_app/features/home/view/widgets/recent_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const DefaultAppBar(
                isHome: true, /* showBack: false,showBookmarks: false, */
              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top Courses',
                        style: TextStyle(
                            fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                      ),
                      const HorizontalCourseListView(),
                      const RecentCourse(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        'Courses Type',
                        style: TextStyle(
                            fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      const CourseCategoriesGridView()
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
