import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/data/network/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: () async {
              print("======");
              await FirebaseFirestore.instance.collection('user_info').add({
                'test1': 'test1111',
                'test2': 'test2222',
              });
            },
            icon: const Icon(Icons.add),
          ),
      /* SafeArea(
          child: Column(
        children: [DefaultAppBar(title: 'Cart'),],
      ),), */
    ));
  }
}
