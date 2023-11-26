import 'dart:developer';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/core/widgets/vertical_course_card.dart';
import 'package:elearning_app/features/cart/view/view_model/cart_controller.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DefaultAppBar(title: 'Cart'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CartController>(
                builder: (context, provider, child) {
                  if (provider.cartCourses.isNotEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQueryHelper.height / 1.5,
                          child: ListView.builder(
                            itemCount: provider.cartCourses.length,
                            itemBuilder: (context, index) {
                              return VerticalCourseCard(
                                course: provider.cartCourses[index],
                                cartOnPressed: () {
                                  provider.removeCourse(
                                    provider.cartCourses[index].id!,
                                  );
                                },
                                isCart: true,
                              );
                            },
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total:\$${provider.total}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                              DefaultButton(
                                text: 'Buy',
                                height: MediaQueryHelper.height * 0.05,
                                width: MediaQueryHelper.width * 0.3,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                onPressed: () => AppRoutes.pushNamedNavigator(
                                    routeName: Routes.payment),
                              ),
                            ])
                      ],
                    );
                  } else {
                    log('message: ${provider.cartCourses}');
                    return Column(children: [
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
                      const Center(
                        child: Text('No Courses in Cart'),
                      ),
                    ]);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
