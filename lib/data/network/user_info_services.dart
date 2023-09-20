import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';

class UserInfoServices {
  CollectionReference allUsersInfo =
      FirebaseFirestore.instance.collection(userInfoCollectionName);

  Future<List<UserInfoModel>> getAllInfoFromUser() async {
    List<UserInfoModel> listOfUsersInof = [];
    QuerySnapshot querySnapshot = await allUsersInfo.get(); 
    listOfUsersInof = querySnapshot.docs
        .map((e) => UserInfoModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    return listOfUsersInof;
  }
}
