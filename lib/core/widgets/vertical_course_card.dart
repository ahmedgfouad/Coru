import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/features/home/view_model/home_controller.dart';
import 'package:elearning_app/features/my_courses/view/widgets/progress_circle.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class VerticalCourseCard extends StatelessWidget {
  //final bool bookmarked;
  final bool isProgress;
  final  course;
  /* final int index; */
  //final bool isRecent;
  const VerticalCourseCard({
    super.key,
    required this.course,
    /*  required this.index, */
    //this.isRecent=false,
    // this.bookmarked = false,
    this.isProgress = false,
    // required this.course,
  });

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeController>(context, listen: true);
    return InkWell(
      onTap: () {
        homeProvider.recentCourse = course;
        homeProvider.recentCourse!.id = course.id;
        homeProvider.getRecentCourse();
        AppRoutes.pushNamedNavigator(
            routeName: Routes.courseDetails, arguments: course);
      },
      child: Container(
        //width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.17,
        margin: EdgeInsets.symmetric(vertical: 8.0.r, horizontal: 4.r),
        padding: EdgeInsets.all(16.0.r),
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
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0.r),
              ),
              child: Image.network(
                course.image /* course.image */ ??
                    'https://picsum.photos/200/300',
                // course.coverImage,
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
                      course.name /* course.name */ ?? 'Text',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 17.0.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .02),
                    isProgress
                        ? Text(
                            course.instructor! /* course.price */,
                            //course.price.toStringAsFixed(2) + '\$',
                            style: TextStyle(
                              fontSize: 11.0.sp,
                              /* fontWeight: FontWeight.bold, */
                              color: AppColors.grey,
                            ),
                          )
                        : Text(
                            '\$${course.price!}' /* course.price */,
                            //course.price.toStringAsFixed(2) + '\$',
                            style: TextStyle(
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .005),
                    // Row(children: [
                    //   Icon(
                    //     Icons.star,
                    //     color: Colors.yellow,
                    //     size: 12.0.r,
                    //   ),
                    //   SizedBox(
                    //       width: MediaQuery.sizeOf(context).width * .01),
                    //   Text(
                    //     '4.0',
                    //     style: TextStyle(
                    //       color: Colors.grey,
                    //       fontSize: 10.0.r,
                    //     ),
                    //   ),
                    // ]),
                  ],
                ),
              ),
            ),
           
             isProgress ? const ProgressCircle() : Container(),
          ],
        ),
      ),
    );

    /* Consumer<HomeController>(builder: (context, value, child) {
      if (value.courses != null) {
         } else /* if (value.courses == null) */ {
        return const Center(child: CircularProgressIndicator());
      }
    }) */
  }
}
