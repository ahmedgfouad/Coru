import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';

class HeaderChatWidget extends StatelessWidget {
  const HeaderChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoutes.pushNamedNavigator(routeName: Routes.chat);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(AppImages.avatar),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ahmed Gamal",
                    style: AppStyles.textStyle16,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      "How are you ? How are you ? How are you ? ",
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.textStyle14
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Row(
                children: [
                  Text(
                    "10 :20 AM",
                    style: AppStyles.textStyle12,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    radius: 12,
                    child: Text("2"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
