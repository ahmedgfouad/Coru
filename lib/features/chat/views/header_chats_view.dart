import 'package:elearning_app/features/chat/views/view_model/chat_controller.dart';
import 'package:elearning_app/features/chat/views/widgets/header_chat_widget.dart';
import 'package:elearning_app/features/chat/views/widgets/search_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HeaderChatsView extends StatelessWidget {
  const HeaderChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ChatController>(builder: (
        BuildContext context,
        ChatController provider,
        Widget? child,
      ) {
        provider.searchForUser(provider.searchController.text);
        return SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SearchChatWidget(),
                        SizedBox(height: 10.h),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.allUsersInfo.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (provider.allUsersInfo.isNotEmpty) {
                                return HeaderChatWidget(
                                  userInfoModel: provider.allUsersInfo[index],
                                );
                              } else {
                                return const Text("Error");
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

/*
  
       
*/
