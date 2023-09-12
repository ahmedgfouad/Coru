// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LogInController extends ChangeNotifier {
  static final GlobalKey<FormState> formStat = GlobalKey();

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  static bool obSecure = true;

  changeObSecure() {
    obSecure = !obSecure;
    notifyListeners();
  }

  makeTextFormFieldEmpty() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    notifyListeners();
  }

  loginAuth(String email, String password) async {
    var formData = formStat.currentState;
    if (formData!.validate()) {
      formData.save();
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('لا يوجد مستخدم لهذا الايميل ');
        } else if (e.code == 'wrong-password') {
          print('كلمه المرور خاطئه');
        }
      }
    } else {
      print("Not Valid");
    }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
//ahmedgfouad2020@gmail.com