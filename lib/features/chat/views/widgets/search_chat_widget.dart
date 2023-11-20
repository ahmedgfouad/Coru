import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/chat/views/view_model/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchChatWidget extends StatelessWidget {
  const SearchChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatController>(builder: (
      BuildContext context,
      ChatController provider,
      Widget? child,
    ) {
      List ex = [];
      return DefaultFormField(
        width: 400,
        height: 50,
        isAuth: false,
        hintText: "Search",
        controller: provider.searchController,
        suffix: Icons.search,
        isPassword: true,
        suffixButtonPressed: () {
          ex.add(2);
          ex.forEach((element) {
            print("========");
            print(ex);
            print("========");
          });
          ex.clear();
          print(ex);
          print("object");
          // List li = [5, 6];
          // li.forEach((element) {
          //   ex.add(element);
          // });
          // print(ex);
        },
        validate: (val) {
          return null;
        },
      );
    });
  }
}
