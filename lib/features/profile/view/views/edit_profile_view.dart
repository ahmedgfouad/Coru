import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/core/widgets/default_text_form_field.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            const DefaultAppBar(title: "Edit Profile"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Consumer<EditProfileController>(
                builder: (
                  BuildContext context,
                  EditProfileController provider,
                  Widget? child,
                ) {
                  provider.getUserDataById();
                  var userData = provider.userDataById;
                  if (userData != null) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              radius: 32,
                              child: userData.imageProfileUrl != null
                                  ? CircleAvatar(
                                      radius: 30.w,
                                      backgroundImage: NetworkImage(
                                        "${userData.imageProfileUrl}",
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 26.w,
                                      backgroundImage: const AssetImage(
                                        AppImages.avatar,
                                      ),
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
                              width: 130.w,
                              height: 45.h,
                              initValue: userData.firstName,
                              onChange: (val) {
                                provider.changeFirstName(firstName: val!);
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
                                initValue: userData.lasttName,
                                onChange: (val) {
                                  provider.changeLastName(lastName: val!);
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
                            initValue: userData.email,
                            onChange: (val) {
                              provider.changeEmail(email: val!);
                            },
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'You should enter email';
                              }
                              return null;
                            }),
                        const SizedBox(height: 20),
                        DefaultFormField(
                          tittle: "Password",
                          width: 300,
                          height: 45,
                          onChange: (val) {
                            userData.password = val;
                          },
                          initValue: userData.password,
                          validate: (val) {
                            if (val!.isEmpty) {
                              provider.changePassword(password: val);
                            }
                            return null;
                          },
                          suffix: EditProfileController.obSecurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          isPassword: true,
                          obSecure: EditProfileController.obSecurePassword,
                          suffixButtonPressed: () {
                            provider.changeObSecurePassword();
                          },
                        ),
                        const SizedBox(height: 10),
                        DefaultFormField(
                          tittle: "Confirm Password",
                          width: 300,
                          height: 45,
                          onChange: (val) {
                            provider.changeConfirmPassword(
                                confirmPassword: val!);
                          },
                          initValue: userData.cofirmPassword,
                          validate: (value) {
                            return null;
                          },
                          suffix: EditProfileController.obSecureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          isPassword: true,
                          obSecure:
                              EditProfileController.obSecureConfirmPassword,
                          suffixButtonPressed: () {
                            provider.changeObSecureConfirmPassword();
                          },
                        ),
                        const SizedBox(height: 10),
                        DefaultButton(
                          onPressed: () async {
                            provider.editProfile();

                            // await userInfoRef
                            //     .doc(snapShot.data!.docs[0].id)
                            //     .update({
                            //   'first_name': firstName,
                            //   'last_name': lastName,
                            //   'email': email,
                            //   'password': password,
                            //   'confirm_password': confirmPassword,
                            // });

                            // showCustomSnackBar(
                            //     context, "data has changed");
                            // await EditProfileController()
                            //     .uploadingImageToFireStore();
                            // await userInfoRef
                            //     .doc(snapShot.data!.docs[0].id)
                            //     .update({
                            //   'image_profile_rul':
                            //       EditProfileController.imageUrl,
                            // });

                            // Navigator.pop(context);
                          },
                          width: 300,
                          height: 45,
                          backgroundColor: AppColors.primaryColor,
                          text: "Confirm",
                          borderRadius: 15,
                        ),
                      ],
                    );
                  }
                  if (userData == null) {
                    return const Center(
                      child: Text("has Eroor"),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
