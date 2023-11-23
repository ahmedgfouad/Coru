import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/features/cart/view/view_model/cart_controller.dart';
import 'package:elearning_app/features/home/view/widgets/course_app_bar.dart';
import 'package:elearning_app/features/home/view/widgets/lessons_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CourseDetailsView extends StatelessWidget {
  final CourseDetailsModel course;

  const CourseDetailsView({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          //physics: const BouncingScrollPhysics(),
          slivers: [
            CourseDetailsAppBar(image: course.image!),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQueryHelper.width * .05,
                    vertical: MediaQueryHelper.height * .02),
                width: MediaQueryHelper.width,
                height: MediaQueryHelper.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              course.name!,
                              //  overflow: TextOverflow.ellipsis,
                              //maxLines: 4,
                              style: TextStyle(
                                  fontSize: 22.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                AppImages.bookmark,
                                width: MediaQuery.of(context).size.width * 0.04,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                colorFilter: ColorFilter.mode(
                                    AppColors.primaryColor, BlendMode.srcIn),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: MediaQueryHelper.height * .03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${course.price!}',
                            style: TextStyle(
                              fontSize: 30.0.sp,
                              fontWeight: FontWeight.bold,
                              // color: AppColors.primaryColor,
                            ),
                          ),
                          DefaultButton(
                            borderRadius: 10,
                            text: 'Add to Cart',
                            backgroundColor: AppColors.primaryColor,
                            width: MediaQueryHelper.width * .4,
                            height: MediaQueryHelper.height * .05,
                            onPressed: () {
                              Provider.of<CartController>(context,
                                      listen: false)
                                  .addCourse(course);
                              Provider.of<CartController>(context,
                                      listen: false)
                                  .getTotal();
                              Navigator.pop(context,true);
                              /* AppRoutes.pushNamedNavigator(
                                  routeName: Routes.cart/* ,arguments: course */); */
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQueryHelper.height * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.groups_2,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                width: MediaQueryHelper.width * .01,
                              ),
                              Text('${course.studentNumber!} student')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                width: MediaQueryHelper.width * .01,
                              ),
                              Text('${course.hours!} hours')
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.article_outlined,
                                color: AppColors.primaryColor,
                              ),
                              SizedBox(
                                width: MediaQueryHelper.width * .01,
                              ),
                              const Text('Certificate')
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      Text(
                        ' About',
                        style: TextStyle(
                            fontSize: 22.0.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(course.about!),
                      const Divider(thickness: 1, color: Colors.grey),
                      Text(
                        ' Lessons',
                        style: TextStyle(
                            fontSize: 22.0.sp, fontWeight: FontWeight.bold),
                      ),
                      LessonsList(lesson: course.lessons!),
                      DefaultButton(
                        borderRadius: 10,
                        text: 'Buy Now',
                        backgroundColor: AppColors.primaryColor,
                        width: MediaQueryHelper.width * .4,
                        height: MediaQueryHelper.height * .05,
                        onPressed: () {},
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
