import 'dart:developer';

import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/features/home/view_model/home_controller.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HorizontalCourseListView extends StatefulWidget {
  const HorizontalCourseListView({
    super.key,
  });

  @override
  State<HorizontalCourseListView> createState() =>
      _HorizontalCourseListViewState();
}

class _HorizontalCourseListViewState extends State<HorizontalCourseListView> {
  @override
  Widget build(BuildContext context) {
    // var top = Provider.of<HomeController>(context).getTopCourses;
    return SizedBox(
      height: MediaQueryHelper.height * 0.27,
      child: Consumer<HomeController>(
        builder: (context, provider, child) {
          if (provider.topCourses == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.topCourses!.length,
                //itemCount: 3,
                itemBuilder: (context, index) {
                  log('top course id $index : ${provider.topCourses![index].id.toString()}');

                  return InkWell(
                    onTap: () {
                      provider.recentCourse = provider.topCourses![index];
                      provider.recentCourse!.id =
                          provider.topCourses![index].id;
                      provider.getRecentCourse();
                      AppRoutes.pushNamedNavigator(
                          routeName: Routes.courseDetails,
                          arguments: provider.topCourses![index]);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      margin:
                          EdgeInsets.fromLTRB(12.0.r, 12.0.r, 12.0.r, 16.0.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0.r),
                        color: Theme.of(context).colorScheme.primaryContainer,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            blurRadius: 8.0.r,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(14.0.r),
                                  topRight: Radius.circular(14.0.r)),
                              child: Image.network(
                                "${provider.topCourses![index].image}",
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width * 0.7,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(
                                  16.0.r, 16.0.r, 16.0.r, 0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${provider.topCourses![index].name}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.textStyle16.copyWith(
                                          fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.background),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$${provider.topCourses![index].price}',
                                        style: AppStyles.textStyle16,
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.002),
                                      Row(children: [
                                        Icon(
                                          Icons.star,
                                          //color: AppColors.thirdColor,
                                          size: 12.0.r,
                                          color: Colors.amber,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01),
                                        Text(
                                          '${provider.topCourses![index].rating}',
                                          style: AppStyles.textStyle10.copyWith(color: Colors.grey),
                                          //textColor: Colors.grey,
                                        )
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
