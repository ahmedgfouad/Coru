import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EX extends StatelessWidget {
  const EX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Consumer<EditProfileController>(
        builder: (
          BuildContext context,
          EditProfileController provider,
          Widget? child,
        ) =>
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                CollectionReference testData = FirebaseFirestore.instance
                    .collection(userInfoCollectionName);

                var dataOfTest =
                    await testData.doc('Ygq4oW7dXmOoa8Lbv7sz4xeNweI3').get();
                var data = dataOfTest.data() as Map<String, dynamic>;
                print("======");
                print(data['email']);
                print("=====");
                // await provider.getUserDataById();
                // print("=======");
                // await provider.getUserDataTest();
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      )),
    );
  }
}
