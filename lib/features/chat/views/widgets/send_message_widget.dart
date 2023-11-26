import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/chat/views/view_model/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({
    super.key,
    required this.chatDocId,
  });

  final String? chatDocId;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatController>(
      builder: (
        BuildContext context,
        ChatController provider,
        Widget? child,
      ) =>
          DefaultFormField(
        isAuth: false,
        hintText: "send message",
        onSubmitted: (data) {},
        width: MediaQuery.of(context).size.width,
        controller: provider.messageController,
        height: 50,
        suffix: Icons.send,
        isPassword: true,
        validate: (val) {
          return null;
        },
        suffixButtonPressed: () {
          provider.sendMessage(chatDocId);
        },
      ),
    );
  }
}
