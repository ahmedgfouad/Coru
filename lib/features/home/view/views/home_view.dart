 import 'package:elearning_app/features/home/view/widgets/course_categories_grid_view.dart';
import 'package:elearning_app/features/home/view/widgets/horizontal_course_list_view.dart';
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
               //const AlemniAppBar(isHome: true),
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
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             'Recent Course',
                             style: TextStyle(
                                 fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                           ),
                           InkWell(
                             onTap: () {},
                             child: Text('See all',
                                 style:
                                 TextStyle(color: Theme.of(context).colorScheme.primary)),
                           ),
                         ],
                       ),
                       SizedBox(
                           height: MediaQuery.of(context).size.height * 0.01),
                      // const VerticalCourseCard(course: ,),
                       SizedBox(
                           height: MediaQuery.of(context).size.height * 0.01),
                       Text(
                         'Courses Type',
                         style: TextStyle(
                             fontSize: 16.0.sp, fontWeight: FontWeight.bold),
                       ),
                       SizedBox(
                           height: MediaQuery.of(context).size.height * 0.01),
                      // const CourseCategoriesGridView()
                     ]),
               ),
             ],
           ),
         ),
       ),
     );
   }
 }