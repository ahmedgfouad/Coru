// ignore_for_file: must_be_immutable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/chat/data/message_model.dart';
import 'package:elearning_app/features/chat/views/widgets/frient_message_widget.dart';
import 'package:elearning_app/features/chat/views/widgets/my_message_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  CollectionReference messageFireStore =
      FirebaseFirestore.instance.collection("messages");

  final ScrollController scrollController = ScrollController();
  String? emailUser = FirebaseAuth.instance.currentUser!.email;

  ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:
            messageFireStore.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(
                MessageModel.fromJson(
                  snapshot.data!.docs[i],
                ),
              );
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const DefaultAppBar(
                      title: "Chat",
                    ),
                    Expanded(
                      child: ListView.separated(
                        reverse: true,
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemCount: messagesList.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (BuildContext context, int index) =>
                            messagesList[index].id == emailUser
                                ? MyMessageWidget(
                                    messageModel: messagesList[index],
                                  )
                                : FriendMessageWidget(
                                    messageModel: messagesList[index],
                                  ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    DefaultFormField(
                      isAuth: false,
                      hintText: "send message",
                      onSubmitted: (data) {
                        if (data!.isNotEmpty) {
                          messageFireStore.add({
                            kMessages: data,
                            kCreatedAt: DateTime.now(),
                            'id': emailUser,
                          });
                          messageController.clear();
                          print("the user email is $emailUser");
                          scrollController.animateTo(
                            0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      width: MediaQuery.of(context).size.width,
                      controller: messageController,
                      height: 50,
                      suffix: Icons.send,
                      isPassword: true,
                      validate: (val) {
                        return null;
                      },
                      suffixButtonPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
