import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [DefaultAppBar(title: 'Cart'),],
      ),),
    );
  }
}
