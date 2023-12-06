// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/chat/views/view_model/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderChatWidget extends StatelessWidget {
  final UserInfoModel userInfoModel;
  const HeaderChatWidget({
    super.key,
    required this.userInfoModel,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatController>(
      builder: (
        BuildContext context,
        ChatController provider,
        Widget? child,
      ) =>
          GestureDetector(
        onTap: () {
          provider.getChatData(
            userInfoModel.userId,
            context,
          );
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
                const SizedBox(width: 10),
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
                    const SizedBox(height: 5),
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
                const Text(
                  "10 :20 AM",
                  style: AppStyles.textStyle12,
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
