// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/features/chat/views/view_model/chat_controller.dart';
import 'package:elearning_app/features/chat/views/widgets/frient_message_widget.dart';
import 'package:elearning_app/features/chat/views/widgets/my_message_widget.dart';
import 'package:elearning_app/features/chat/views/widgets/send_message_widget.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatView extends StatelessWidget {
  final chatDocId;
  const ChatView({super.key, this.chatDocId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chats')
          .doc(chatDocId)
          .collection("messages")
          .orderBy("createdOn", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          var data;
          return Consumer<ChatController>(builder: (
            BuildContext context,
            ChatController provider,
            Widget? child,
          ) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    DefaultAppBar(title: S.of(context).chat),
                    Expanded(
                      child: ListView(
                        reverse: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          data = document.data()!;
                          return provider.isSender(data['uid'])
                              ? MyMessageWidget(message: data['msg'])
                              : FriendMessageWidget(message: data['msg']);
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SendMessageWidget(chatDocId: chatDocId),
                  ],
                ),
              ),
            );
          });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
