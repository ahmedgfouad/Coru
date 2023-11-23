// ignore_for_file: no_logic_in_create_state, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatEx extends StatefulWidget {
  const ChatEx({super.key, required this.friendUid, required this.friendName});
  final String friendUid;
  final String friendName;
  @override
  State<ChatEx> createState() => _ChatExState(friendUid, friendName);
}

class _ChatExState extends State<ChatEx> {
  CollectionReference chats = FirebaseFirestore.instance.collection("chats");
  final String friendUid;
  final String friendName;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  final _textController = TextEditingController();
  String? chatDocId;
  _ChatExState(this.friendUid, this.friendName);
  @override
  void initState() {
    super.initState();
    chats
        .where("users_info", isEqualTo: {friendUid: null, currentUserId: null})
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) {
            if (querySnapshot.docs.isNotEmpty) {
              chatDocId = querySnapshot.docs.single.id;
            } else {
              chats.add({
                'users': {currentUserId: null, friendUid: null},
              }).then((value) => {
                    chatDocId = value.toString(),
                  });
            }
          },
        )
        .catchError((error) {});
  }

  void sendMessage(String msg) {
    if (msg == '') return;
    chats.doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'Uid': currentUserId,
      'msg': msg,
    }).then((value) {
      _textController.text = '';
    });
  }

  bool isSender(String friend) {
    return friend == currentUserId;
  }

  Alignment getAlignment(friend) {
    if (friend == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(chatDocId)
            .collection('messages')
            .orderBy('createdOn', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("loading");
          }
          if (snapshot.hasData) {
            var data;
            return Scaffold(
              appBar: AppBar(title: const Text("chat screen")),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        reverse: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          data = document.data()!;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ChatBubble(
                              clipper: ChatBubbleClipper6(
                                  nipSize: 0,
                                  radius: 0,
                                  type: BubbleType.receiverBubble),
                              alignment: getAlignment(data['uid'].toString()),
                              margin: const EdgeInsets.only(top: 20),
                              backGroundColor: isSender(data['uid'].toString())
                                  ? const Color(0xff08c187)
                                  : const Color(0xffE7E7ED),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${data['msg']}",
                                        style: TextStyle(
                                          color:
                                              isSender(data['uid'].toString())
                                                  ? Colors.white
                                                  : Colors.black,
                                        ),
                                        maxLines: 100,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextField(controller: _textController),
                        ),
                        IconButton(
                            onPressed: () => sendMessage(_textController.text),
                            icon: const Icon(Icons.send)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        });
  }
}
