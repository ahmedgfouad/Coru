import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/core/widgets/dfault_text_form_field.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  CollectionReference userRef =
      FirebaseFirestore.instance.collection('user_info');
  var firstName, lastName, email, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: userRef.get(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            Map profileData = snapShot.data!.docs[0].data() as Map;
            firstName = profileData['first_name'];
            lastName = profileData['last_name'];
            email = profileData['email'];
            password = profileData['password'];
            confirmPassword = profileData['confirm_password'];
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h
                  ),
                  // CustomAppBar(title: "Edit Profile"),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ChangeNotifierProvider(
                      create: (BuildContext context) => EditProfileController(),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 32,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(AppImages.avatar),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultFormField(
                                tittle: "First name",
                                width: 130,
                                height: 45,
                                initValue: "${profileData['first_name']}",
                                onChange: (val) {
                                  firstName = val;
                                },
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'You should enter first name';
                                  }
                                  return null;
                                },
                              ),
                              DefaultFormField(
                                  tittle: "Last name",
                                  width: 130,
                                  height: 45,
                                  initValue: "${profileData['last_name']}",
                                  onChange: (val) {
                                    lastName = val;
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'You should enter last name';
                                    }
                                    return null;
                                  }),
                            ],
                          ),
                          const SizedBox(height: 10),
                          DefaultFormField(
                              tittle: "Email",
                              width: 300,
                              height: 45,
                              initValue: "${profileData['email']}",
                              onChange: (val) {
                                email = val;
                              },
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'You should enter email';
                                }
                                return null;
                              }),
                          const SizedBox(height: 20),
                          Consumer<EditProfileController>(
                            builder:
                                (BuildContext context, value, Widget? child) =>
                                    DefaultFormField(
                              tittle: "Password",
                              width: 300,
                              height: 45,
                              onChange: (val) {
                                password = val;
                              },
                              initValue: "${profileData['password']}",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'You should enter password';
                                }
                                return null;
                              },
                              suffix: EditProfileController.obSecurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              isPassword: true,
                              obSecure: EditProfileController.obSecurePassword,
                              suffixButtonPressed: () {
                                print("object");
                                value.changeObSecurePassword();
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Consumer<EditProfileController>(
                            builder:
                                (BuildContext context, value, Widget? child) =>
                                    DefaultFormField(
                              tittle: "Confirm Password",
                              width: 300,
                              height: 45,
                              onChange: (val) {
                                confirmPassword = val;
                              },
                              initValue: "${profileData['confirm_password']}",
                              validate: (value) {
                                return null;
                              },
                              suffix:
                                  EditProfileController.obSecureConfirmPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.remove_red_eye_outlined,
                              isPassword: true,
                              obSecure:
                                  EditProfileController.obSecureConfirmPassword,
                              suffixButtonPressed: () {
                                value.changeObSecureConfirmPassword();
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          DefaultButton(
                            onPressed: () async {
                              print(firstName);
                              await userRef
                                  .doc(snapShot.data!.docs[0].id)
                                  .update({
                                'first_name': firstName,
                                'last_name': lastName,
                                'email': email,
                                'password': password,
                                'confirm_password': confirmPassword,
                              });
                              Navigator.pop(context);
                            },
                            width: 300,
                            height: 45,
                            backgroundColor: AppColors.primaryColor,
                            text: "Confirm",
                            borderRadius: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (snapShot.hasError) {
            print("============has Error===========");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
