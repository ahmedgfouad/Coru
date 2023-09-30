import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/features/home/view_model/home_controller.dart';
import 'package:elearning_app/handlers/localization.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CourseCategoriesGridView extends StatelessWidget {
  const CourseCategoriesGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeController>(context, listen: true);

    List<Map<String, dynamic>> category = [
      {'title': getLang(context, 'all_courses'), 'icon': AppImages.allCourses},
      {'title': getLang(context, 'medical'), 'icon': AppImages.medical},
      {'title': getLang(context, 'programming'), 'icon': AppImages.programming},
      {'title': getLang(context, 'marketing'), 'icon': AppImages.marketing},
      {'title': getLang(context, 'business'), 'icon': AppImages.business},
      {'title': getLang(context, 'd3_design'), 'icon': AppImages.d3Design},
    ];

    return SizedBox(
      height: MediaQuery.of(context).size.height * .8,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: category.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 4 / 5, mainAxisExtent: 190.r),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            
            provider.getCourses(courseFilter: category[index]['title']);
            AppRoutes.pushNamedNavigator(
                routeName: Routes.coursesCategories,
                arguments: category[index]['title']);
          },
          child: Container(
            margin: EdgeInsets.all(8.0.r),
            padding: EdgeInsets.all(8.0.r),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    blurRadius: 8.0.r,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 0),
                  ),
                ],
                color: Theme.of(context).colorScheme.secondary/* .withOpacity(.7) */,
                borderRadius: BorderRadius.circular(15.r)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    category[index]['icon'],
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.1,
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                  Text(
                    category[index]['title'],
                    style: AppStyles.textStyle20,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
