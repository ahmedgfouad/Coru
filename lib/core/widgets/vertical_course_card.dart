import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/data/model/users_info/my_course_model.dart';
import 'package:elearning_app/features/home/view/view_model/home_controller.dart';
import 'package:elearning_app/features/my_courses/view/widgets/progress_circle.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class VerticalCourseCard extends StatelessWidget {
  final bool isProgress;
  final bool isCart;
  final CourseDetailsModel course;
  final MyCourseModel? myCourse;
  final Function()? deleateOnPressed;
  const VerticalCourseCard({
    super.key,
    required this.course,
    this.isProgress = false,
    this.myCourse,
    this.isCart = false,
    this.deleateOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeController>(context, listen: true);
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.17,
          margin: EdgeInsets.symmetric(vertical: 8.0.r, horizontal: 4.r),
          padding: EdgeInsets.all(10.0.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0.r),
            color: Theme.of(context).colorScheme.inversePrimary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 12.0.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: InkWell(
            onTap: () async {
              homeProvider.recentCourse = course;
              homeProvider.recentCourse!.id = course.id;
              homeProvider.getRecentCourse();
              var value = await AppRoutes.pushNamedNavigator(
                  routeName: Routes.courseDetails, arguments: course);
              if (value == true) {}
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12.0.r)),
                  child: Image.network(
                    course.image ?? 'https://picsum.photos/200/300',
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.27,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.0.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          course.name ?? 'Text',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              '\$${course.price!}',
                              style: TextStyle(
                                fontSize: 15.0.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Icon(
                              Icons.person,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              course.instructor!,
                              style: AppStyles.textStyle14,
                            ),
                          ],
                        ),
                        AnimatedRatingStars(
                          initialRating: double.parse("${course.rating}"),
                          filledColor: AppColors.primaryColor,
                          onChanged: (double rating) {},
                          customFilledIcon: Icons.star,
                          customHalfFilledIcon: Icons.star_half,
                          customEmptyIcon: Icons.star_border,
                          starSize: 15.0,
                          animationCurve: Curves.easeInOut,
                          readOnly: false,
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
                  ),
                ),
                isProgress
                    ? ProgressCircle(
                        progress: myCourse!.progress!,
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        isCart
            ? Positioned(
                top: 10,
                right: -1,
                child: IconButton(
                  onPressed: deleateOnPressed,
                  icon: Icon(
                    Icons.delete,
                    color: AppColors.primaryColor,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
