import 'package:elearning_app/features/Authentication/view/views/widgets/having_accounts.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';

class HavingAccountSectionWidet extends StatelessWidget {
  const HavingAccountSectionWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HavingAccount(
          question: "Have account",
          screenName: "Login ",
          routeScreenName: Routes.login,
        ),
      ],
    );
  }
}
