import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/ex_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PeopleEx extends StatelessWidget {
  PeopleEx({super.key});
  var curentUser = FirebaseAuth.instance.currentUser!.uid;

  void callChatDetailsScreen(BuildContext context, String name, String uid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatEx(
          friendName: name,
          friendUid: uid,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users_info')
            .where('user_id', isNotEqualTo: curentUser)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("loading");
          }
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(title: const Text("People")),
              body: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        return ListTile(
                          onTap: () {
                            callChatDetailsScreen(
                              context,
                              data['first_name'],
                              data['user_id'],
                            );
                          },
                          title: Text(data["first_name"]),
                          subtitle: Text(data["email"]),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }
          return const CircleAvatar();
        });
  }
}
