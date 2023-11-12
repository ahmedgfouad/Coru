import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/data/model/users_info/my_course_model.dart';
import 'package:elearning_app/features/home/view_model/home_controller.dart';
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
  final Function()? cartOnPressed;
  const VerticalCourseCard({
    super.key,
    required this.course,
    this.isProgress = false,
    this.myCourse,
    this.isCart = false,
    this.cartOnPressed,
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
            color: Colors.white,
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 4.0.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .01,
                        ),
                        Text(
                          course.name ?? 'Text',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * .02),
                        isProgress
                            ? Text(
                                course.instructor!,
                                style: TextStyle(
                                  fontSize: 11.0.sp,
                                  color: AppColors.grey,
                                ),
                              )
                            : Text(
                                '\$${course.price!}',
                                style: TextStyle(
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * .005),
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
                top: -1,
                right: -1,
                child: IconButton(
                  onPressed: cartOnPressed,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
