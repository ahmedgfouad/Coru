// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/data/network/user_services.dart';
import 'package:elearning_app/features/chat/views/chat_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatController extends ChangeNotifier {
  final UserServices _userInfoServices = UserServices();
  TextEditingController searchController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  bool isSearchFieldEmpty = true;
  List<UserInfoModel> allUsersInfo = [];

  CollectionReference chats = FirebaseFirestore.instance.collection("chats"); 
  var chatDocId;
  

  void changeSearchStateToEmpty() {
    isSearchFieldEmpty = true;
    notifyListeners();
  }

  void changeSearchStateToNotEmpty() {
    isSearchFieldEmpty = false;
    notifyListeners();
  }

  void getallUsersInfo() async {
    allUsersInfo = await _userInfoServices.getAllUsersInfo();
    notifyListeners();
  }

  void searchForUser(String name) async {
    allUsersInfo = await _userInfoServices.getAllUsersInfo().then(
          (value) => value.where(
            (element) {
              var fullName = "${element.firstName}${element.lasttName}";
              return fullName.toLowerCase().contains(name);
            },
          ).toList(),
        );
    notifyListeners();
  }

  void sendMessage(chatDocId) {
    if (messageController.text.isEmpty) return;
    chats.doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'msg': messageController.text,
    }).then((value) {
      messageController.clear();
    });
  }

  bool isSender(String messageId) {
    return messageId == FirebaseAuth.instance.currentUser!.uid;
  }

  void getChatData(friendId, context) async {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    await chats
        .where(
          'users',
          isEqualTo: {friendId: null, currentUserId: null},
        )
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) {
            if (querySnapshot.docs.isNotEmpty) {
              chatDocId = querySnapshot.docs.single.id.toString();
              notifyListeners();
            } else {
              chats.add({
                'users': {currentUserId: null, friendId.userId.toString(): null}
              }).then((value) => {
                    chatDocId = value.toString(),
                  });
              notifyListeners();
            }
          },
        )
        .catchError((error) {});

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatView(chatDocId: chatDocId),
      ),
    );
  }
}
