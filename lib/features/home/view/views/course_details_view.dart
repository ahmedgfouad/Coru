import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/features/home/view/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/about_tab_bar.dart';
import '../widgets/lessons_tab_bar.dart';

class CourseDetailsView extends StatefulWidget {
  final CourseDetailsModel course;
  const CourseDetailsView({super.key, required this.course});

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    /* CourseDetailsModel().getCourseDetails(courseId: 'VBSLwh4NeHEYeDfuYJHn');
    AllCoursesModel().getAllCourses(); */
    /*  CourseCategoryModel().getCourseCategory(); */
    /* BookmarkedCourses().getBookmarkedCourses(); */
    /* AddCourse().addCourse(); */
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const DefaultAppBar(title: 'Course Details'),
            Image.network(
              widget.course.image!,
              height: MediaQuery.sizeOf(context).height * .3,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.course.name!,
                            //  overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: TextStyle(
                                fontSize: 22.0.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppImages.bookmark,
                              width: MediaQuery.of(context).size.width * 0.04,
                              height: MediaQuery.of(context).size.height * 0.04,
                              colorFilter: ColorFilter.mode(
                                  AppColors.primaryColor, BlendMode.srcIn),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${widget.course.price!}',
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
                          width: MediaQuery.sizeOf(context).width * .4,
                          height: MediaQuery.sizeOf(context).height * .05,
                          onPressed: () {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .01,
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
                              width: MediaQuery.sizeOf(context).width * .01,
                            ),
                            Text('${widget.course.studentNumber!} student')
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .01,
                            ),
                            Text('${widget.course.hours!} hours')
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.article_outlined,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * .01,
                            ),
                            const Text('Certificate')
                          ],
                        ),
                      ],
                    ),
                    const Divider(thickness: 2, color: Colors.grey),
                    CustomTabBar(
                      isMyCourses: false,
                      tabController: _tabController,
                      viewsBody:  [
                        AboutTabBar(description: widget.course.about!),
                        LessonsTabBar(lesson: widget.course.lessons!),
                      ],
                      viewsTitle: const [
                        Tab(
                          text: 'About',
                        ),
                        Tab(
                          text: 'Lessons',
                        ),
                      ],
                    ),
                    DefaultButton(
                      borderRadius: 10,
                      text: 'Buy Now',
                      backgroundColor: AppColors.primaryColor,
                      width: MediaQuery.sizeOf(context).width * .4,
                      height: MediaQuery.sizeOf(context).height * .05,
                      onPressed: () {},
                    )
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
