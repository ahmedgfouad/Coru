import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/features/home/view/widgets/course_categories_grid_view.dart';
import 'package:elearning_app/features/home/view/widgets/horizontal_course_list_view.dart';

import 'package:elearning_app/features/home/view/widgets/recent_course.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:elearning_app/core/widgets/vertical_course_card.dart';

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
                isHome: true, 
              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).top_courses,
                        style: TextStyle(
                            fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                      ),
                      const HorizontalCourseListView(),
                      const RecentCourse(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        S.of(context).coursses_type,
                        style: TextStyle(
                            fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
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
