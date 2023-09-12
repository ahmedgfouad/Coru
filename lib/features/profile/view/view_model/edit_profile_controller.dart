import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EditProfileController extends ChangeNotifier{
  CollectionReference profileInfoReference = FirebaseFirestore.instance.collection('users_info');

  editProfile(
       var docId,
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      ){
    profileInfoReference.doc(docId).update({
      'first_name': firstName,
      'last_name' : lastName,
      'email' : email,
      'password' : password,
      'confirm_password' : confirmPassword,
    });
  }

  static bool obSecurePassword = true;
  static bool obSecureConfirmPassword = true;

  changeObSecurePassword() {
    print("in change ob secure password method ");
    obSecurePassword =! obSecurePassword;
    notifyListeners();
  }

  changeObSecureConfirmPassword() {
    obSecureConfirmPassword =! obSecureConfirmPassword;
    notifyListeners();
  }
}