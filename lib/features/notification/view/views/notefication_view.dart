import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/data/network/user_info_services.dart';
import 'package:elearning_app/features/chat/views/view_model/chat_controller.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              print("======");

              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: "test@gmail.com",
                password: "password",
              );
              // await FirebaseFirestore.instance
              //     .collection('any_collection')
              //     .add({
              //   'test1': 'test1111',
              //   'test2': 'test2222',
              // });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      )),
    );
  }
}
