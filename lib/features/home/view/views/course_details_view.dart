import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/features/home/view/widgets/about_course_widget.dart';
import 'package:elearning_app/features/home/view/widgets/buy_now_button_widget.dart';
import 'package:elearning_app/features/home/view/widgets/cours_title_and_saved_icon_widget.dart';
import 'package:elearning_app/features/home/view/widgets/course_app_bar.dart';
import 'package:elearning_app/features/home/view/widgets/course_price_and_add_to_card_button_widget.dart';
import 'package:elearning_app/features/home/view/widgets/lesson_course_widget.dart';
import 'package:elearning_app/features/home/view/widgets/number_of_student_houres_course_widget.dart';
import 'package:flutter/material.dart';

class CourseDetailsView extends StatelessWidget {
  final CourseDetailsModel course;

  const CourseDetailsView({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CourseDetailsAppBar(image: course.image!),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQueryHelper.width * .05,
                  vertical: MediaQueryHelper.height * .02,
                ),
                width: MediaQueryHelper.width,
                height: MediaQueryHelper.height,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoursTitleAndBookMarkIconWidget(course: course),
                    const SizedBox(height: 10),
                    CoursePriceAndAddToCardButtonWidget(course: course),
                    const SizedBox(height: 5),
                    NumberOfStrudentAndHoursCourseWidget(course: course),
                    const Divider(thickness: 1, color: Colors.grey),
                    AbouteCourseWidget(course: course),
                    const Divider(thickness: 1, color: Colors.grey),
                    LessonsCoursWidget(course: course),
                    const BuyNowButtonWidget()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
