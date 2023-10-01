// import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/chat/views/widgets/header_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderChatsView extends StatelessWidget {
  const HeaderChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // const DefaultAppBar(
              //   isHome: false,
              //   title: "Inbox",
              // ),
              Padding(
                padding: EdgeInsets.all(10.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DefaultFormField(
                        isAuth: false,
                        hintText: "Search",
                        width: 400,
                        height: 50,
                        suffix: Icons.search,
                        isPassword: true,
                        validate: (val) {
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) =>
                            const HeaderChatWidget(),
                      ),
                      // const HeaderChatWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
