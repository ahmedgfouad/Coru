import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}
 /* getToken() async {
    String? myToken = await FirebaseMessaging.instance.getToken();
    
    log('$myToken');
    return myToken;
  } */
class _ExampleState extends State<Example> {
 

  @override
  void initState() {FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Change here
    _firebaseMessaging.getToken().then((token){
      print("token is $token");
    // TODO: implement initState
    super.initState();
    
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Navigation Bar"),
      ),
      // INCLUDE LIST OF WIDGETS INSIDE BODY
      // [Home(), Search(), Cart(), Profile()]
    );
  }
}
