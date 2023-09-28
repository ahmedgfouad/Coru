import 'dart:developer';

import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/core/widgets/vertical_course_card.dart';
import 'package:elearning_app/data/model/course_detials_model.dart';
import 'package:elearning_app/features/cart/view/view_model/cart_controller.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  final CourseDetailsModel? course;
  const CartView({super.key, this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<CartController>(
            builder: (context, value, child) {
              if (course != null) {
                log('message: course: ${course!.name}');
                value.addCourse(course!);
                log('message: ${value.cartCourses}');
                value.getTotal();
              }
              if (value.cartCourses.isNotEmpty) {
                return Column(
                  children: [
                    const DefaultAppBar(title: 'Cart'),
                    SizedBox(
                      height: MediaQueryHelper.height * 0.73,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          log('message: ${value.cartCourses[index]}');
                          return VerticalCourseCard(
                            course: value.cartCourses[index],
                            cartOnPressed: () {
                              value.removeCourse(course!);
                            },
                            isCart: true,
                          );
                        },
                        itemCount: value.cartCourses.length,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text('Total:\$${value.total}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Expanded(
                            flex: 2,
                            child: DefaultButton(
                              text: 'Buy',
                              height: MediaQueryHelper.height * 0.05,
                              width: MediaQueryHelper.width * 0.3,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              onPressed: () => AppRoutes.pushNamedNavigator(
                                  routeName: Routes.payment),
                            ),
                          ),
                        ])
                  ],
                );
              } else {
                log('message: ${value.cartCourses}');
                return Column(//mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const DefaultAppBar(title: 'Cart'),
                  //Spacer(),
                  SizedBox(
                    height: MediaQueryHelper.height * .2,
                  ),
                  SvgPicture.asset(
                    AppImages.emptyCart,
                    height: 250,
                  ),
                  SizedBox(
                    height: MediaQueryHelper.height * .02,
                  ),
                  Center(
                    child: Text('No Courses in Cart'),
                  ),
                ]);
              }
            },
          ),
        ),
      ),
    );
  }
}
