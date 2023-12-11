import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/features/home/view/view_model/home_controller.dart';
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
    return Consumer<HomeController>(
      builder: (
        BuildContext context,
        provider,
        Widget? child,
      ) =>
          SizedBox(
        height: MediaQuery.of(context).size.height * .8,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.category.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5,
            mainAxisExtent: 190.r,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              provider.getCourses(
                  courseFilter: provider.category[index]['title']);
              AppRoutes.pushNamedNavigator(
                routeName: Routes.coursesCategories,
                arguments: provider.category[index]['title'],
              );
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
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    provider.category[index]['icon'],
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.height * 0.1,
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ),
                  Text(
                    provider.category[index]['title'],
                    style: AppStyles.textStyle20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
