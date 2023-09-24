import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> viewsBody;
  final List<Tab> viewsTitle;

  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.viewsBody,
    required this.viewsTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQueryHelper.height * .05,
        child: TabBar(
          unselectedLabelColor: Colors.grey, indicatorWeight: 3,
          labelColor: AppColors.primaryColor, isScrollable: false,
          labelStyle: TextStyle(fontSize: 17.sp),
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          physics: const NeverScrollableScrollPhysics(),
          indicatorColor: AppColors.primaryColor,
          // labelColor: Colors.white,
          //  unselectedLabelColor: Colors.grey.shade900,
          tabs: viewsTitle,
        ),
      ),
      SizedBox(
        height: MediaQueryHelper.height * .75,
        width: MediaQueryHelper.width,
        child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          children: viewsBody,
        ),
      ),
    ]);
  }
}
