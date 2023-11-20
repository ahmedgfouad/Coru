// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ex extends StatelessWidget {
  Ex({super.key});

  var curentUser = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ExController>(
        builder: (
          BuildContext context,
          ExController provider,
          Widget? child,
        ) {
          provider.getUsers();

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: provider.lisOfUsers.length,
            itemBuilder: (context, index) { 
              return Card(
                child: ListTile(
                  title: Text("${provider.lisOfUsers[index].firstName}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ExServices {
  CollectionReference allUsersInfo =
      FirebaseFirestore.instance.collection(userInfoCollectionName);

  String curentuser = FirebaseAuth.instance.currentUser!.uid;

  Future<List<UserInfoModel>> exGetAllUsers() async {
    List<UserInfoModel> listOfAllUsersInof = [];
    QuerySnapshot querySnapshot =
        await allUsersInfo.where('user_id', isNotEqualTo: curentuser).get();
    listOfAllUsersInof = querySnapshot.docs
        .map((e) => UserInfoModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return listOfAllUsersInof;
  }
}

class ExController extends ChangeNotifier {
  ExServices userServices = ExServices();
  List<UserInfoModel> lisOfUsers = [];

  void getUsers() async {
    lisOfUsers = await userServices.exGetAllUsers();
    notifyListeners();
  }
}
