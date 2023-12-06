// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:elearning_app/core/utilities/media_quary.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';

class TotalPriceCorsesInCartAndBuyButtonWidget extends StatelessWidget {
  final provider;
  const TotalPriceCorsesInCartAndBuyButtonWidget({
    this.provider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('${S.of(context).total}:\$${provider.total}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        DefaultButton(
          text: S.of(context).buy_now,
          height: MediaQueryHelper.height * 0.05,
          width: MediaQueryHelper.width * 0.3,
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () =>
              AppRoutes.pushNamedNavigator(routeName: Routes.payment),
        ),
      ],
    );
  }
}
