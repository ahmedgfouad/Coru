import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/chat/views/view_model/chat_controller.dart';
import 'package:elearning_app/generated/l10n.dart';
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
      return DefaultFormField(
        width: 400,
        height: 50,
        isAuth: false,
        hintText: S.of(context).search,
        controller: provider.searchController,
        suffix: Icons.search,
        isPassword: true,
        suffixButtonPressed: () {},
        validate: (val) {
          return null;
        },
      );
    });
  }
}
