import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/features/cart/view/view_model/cart_controller.dart';
import 'package:elearning_app/features/cart/view/views/widgets/empty_cart_widget.dart';
import 'package:elearning_app/features/cart/view/views/widgets/list_of_cart_courses_widget.dart';
import 'package:elearning_app/features/cart/view/views/widgets/total_price_and_buy_button_widget.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DefaultAppBar(title: S.of(context).cart),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<CartController>(
                builder: (context, provider, child) {
                  if (provider.cartCourses.isNotEmpty) {
                    return Column(
                      children: [
                        ListOfCartCoursesWidget(provider: provider),
                        TotalPriceCorsesInCartAndBuyButtonWidget(
                          provider: provider,
                        ),
                      ],
                    );
                  } else {
                    return const EmptyCartWidget();
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
