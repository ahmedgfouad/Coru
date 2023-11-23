// ignore_for_file: no_logic_in_create_state, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/chat/views/widgets/frient_message_widget.dart';
import 'package:elearning_app/features/chat/views/widgets/my_message_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  final String? friendUid;
  const ChatView({super.key, this.friendUid});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  String? friendUid;

  CollectionReference chats = FirebaseFirestore.instance.collection("chats");
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController _textController = TextEditingController();
  String? chatDocId;
  @override
  void initState() {
    super.initState();
    friendUid = widget.friendUid;

    chats
        .where(
          'users',
          isEqualTo: {friendUid: null, currentUserId: null},
        )
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) {
            if (querySnapshot.docs.isNotEmpty) {
              chatDocId = querySnapshot.docs.single.id.toString(); 
              return;
            } else {
              chats.add({
                'users': {currentUserId: null, friendUid: null}
              }).then((value) => {
                    chatDocId = value.toString(),
                  });
            }
          },
        )
        .catchError((error) {});
  }

  bool isSender(String friend) {
    return friend == currentUserId;
  }

  void sendMessage(String msg) {
    if (msg.isEmpty) return;
    chats.doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currentUserId,
      'msg': msg,
    }).then((value) {
      _textController.clear();
    });
  }

  Alignment getAlignment(friend) {
    if (friend == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(chatDocId)
            .collection("messages")
            .orderBy("createdOn", descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data;
            return StreamBuilder(
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
                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const DefaultAppBar(title: "Chat"),
                            Expanded(
                              child: ListView(
                                reverse: true,
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  data = document.data()!;
                                  return isSender(data['uid'])
                                      ? MyMessageWidget(
                                          message: data['msg'].toString(),
                                        )
                                      : FriendMessageWidget(
                                          message: data['msg'].toString(),
                                        );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 15),
                            DefaultFormField(
                              isAuth: false,
                              hintText: "send message",
                              onSubmitted: (data) {
                                // sendMessage(data.toString());
                              },
                              width: MediaQuery.of(context).size.width,
                              controller: _textController,
                              height: 50,
                              suffix: Icons.send,
                              isPassword: true,
                              validate: (val) {
                                return null;
                              },
                              suffixButtonPressed: () {
                                sendMessage(_textController.text);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
