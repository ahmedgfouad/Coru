
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/constants.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/data/network/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends ChangeNotifier {
  UserInfoModel? _userDataById;
  UserInfoModel? get userDataById => _userDataById;

  final UserServices _userInfoServices = UserServices();

  CollectionReference profileRef =
      FirebaseFirestore.instance.collection(userInfoCollectionName);

  // UserInfoModel userModel = UserInfoModel();

  static File? file;

  bool obSecurePassword = true;
  bool obSecureConfirmPassword = true;

  Future<UserInfoModel?> getUserDataById() async {
    _userDataById = await _userInfoServices.getInfoOneUserById();
    notifyListeners();
    return _userDataById;
  }

  void changeFirstName({required String firstName}) {
    _userDataById!.firstName = firstName;
    _userDataById!.firstName = firstName;
    notifyListeners();
  }

  void changeLastName({required String lastName}) {
    _userDataById!.lasttName = lastName;
    notifyListeners();
  }

  void changeEmail({required String email}) {
    _userDataById!.email = email;
    notifyListeners();
  }

  void changePassword({required String password}) {
    _userDataById!.password = password;
    notifyListeners();
  }

  void changeConfirmPassword({required String confirmPassword}) {
    _userDataById!.confirmPassword = confirmPassword;
    notifyListeners();
  }

  changeObSecurePassword() {
    obSecurePassword = !obSecurePassword;
    notifyListeners();
  }

  changeObSecureConfirmPassword() {
    obSecureConfirmPassword = !obSecureConfirmPassword;
    notifyListeners();
  }

  takeImage() async {
    var imagePicker = ImagePicker();
    var imgPicked = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imgPicked != null) {
      file = File(imgPicked.path);
    }
  }

  uploadingImageToFireStorage() async {
    _userDataById!.imageProfileUrl =
        await _userInfoServices.uploadingImageToFireStorage(); 
    notifyListeners();
  }

  Future<void> editProfileInfo() async {
    
    _userDataById!.userId = FirebaseAuth.instance.currentUser!.uid;
    await _userInfoServices.updateUserInfoOnFireStore(
      userModel: _userDataById!,
    );
  }


}
