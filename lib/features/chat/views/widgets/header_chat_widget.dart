import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';

class HeaderChatWidget extends StatelessWidget {
  final UserInfoModel userInfoModel;
  const HeaderChatWidget({
    super.key,
    required this.userInfoModel,
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
              CircleAvatar(
                backgroundImage:
                    NetworkImage(userInfoModel.imageProfileUrl.toString()),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${userInfoModel.firstName}",
                        style: AppStyles.textStyle16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${userInfoModel.lasttName}",
                        style: AppStyles.textStyle16,
                      ),
                    ],
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
