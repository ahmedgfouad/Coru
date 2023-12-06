import 'dart:developer';

import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/data/model/lessons_model.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonsListWidget extends StatelessWidget {
  final List<Lessons> lesson;

  const LessonsListWidget({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0.r),
        child: Column(
          children: List.generate(
            lesson.length,
            (index) => InkWell(
              onTap: () {
                AppRoutes.pushNamedNavigator(
                    routeName: Routes.lessonDetails,
                    arguments: {'lesson': lesson[index], 'index': index});
              },
              child: Container(
                  //width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQueryHelper.height * 0.14,
                  margin:
                      EdgeInsets.symmetric(vertical: 8.0.r, horizontal: 4.r),
                  padding: EdgeInsets.symmetric(vertical: 16.0.r),
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
                  child: ListTile(
                    onTap: () {
                      AppRoutes.pushNamedNavigator(
                          routeName: Routes.lessonDetails,
                          arguments: {'lesson': lesson[index], 'index': index});
                    },
                    title: Text(
                      lesson[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 25),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: AppColors.secondaryColor,
                      radius: 22.r,
                      child: Text('${index + 1}',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                    subtitle: Text(
                      lesson[index].description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    trailing: InkWell(
                        onTap: () {
                          log('click');
                        },
                        child: Icon(Icons.play_circle_fill_rounded,
                            color: AppColors.primaryColor, size: 35.0.r)),
                  )),
            ),
          ),
        ));
  }
}
