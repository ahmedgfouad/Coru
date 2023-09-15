// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_typing_uninitialized_variables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/widgets/defaul_app_bar.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/core/widgets/dfault_text_form_field.dart';
import 'package:elearning_app/core/widgets/snack_bar_widget.dart';
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
  CollectionReference userInfoRef =
      FirebaseFirestore.instance.collection('users_info');
  var firstName, lastName, email, password, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: userInfoRef.get(),
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
                  SizedBox(height: 10.h),
                  const DefaultAppBar(title: "Edit Profile"),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ChangeNotifierProvider(
                      create: (BuildContext context) => EditProfileController(),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                radius: 32,
                                child: profileData['image_profile_rul'] != null
                                    ? CircleAvatar(
                                        radius: 30.w,
                                        backgroundImage: NetworkImage(
                                            profileData['image_profile_rul']),
                                      )
                                    : CircleAvatar(
                                        radius: 26.w,
                                        backgroundImage:
                                            const AssetImage(AppImages.avatar),
                                      ),
                              ),
                              Positioned(
                                  right: -15,
                                  top: 20.h,
                                  child: IconButton(
                                    onPressed: () async {
                                      await EditProfileController().takeImage();
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: AppColors.white,
                                    ),
                                  ))
                            ],
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
                              await userInfoRef
                                  .doc(snapShot.data!.docs[0].id)
                                  .update({
                                'first_name': firstName,
                                'last_name': lastName,
                                'email': email,
                                'password': password,
                                'confirm_password': confirmPassword,
                              }); 

                              showCustomSnackBar(context, "data has changed");
                              await EditProfileController()
                                  .uploadingImageToFireStore();
                              await userInfoRef
                                  .doc(snapShot.data!.docs[0].id)
                                  .update({
                                'image_profile_rul':
                                    EditProfileController.imageUrl,
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
