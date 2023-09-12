// import 'dart:developer';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart'; 

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   CollectionReference userInfoReference =
//       FirebaseFirestore.instance.collection('users_info');
//   var firstName, lastName, email, password, confirmPassword;
//   File? xFile;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//       future: userInfoReference
//           .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//           .get(),
//       builder: (context, snapShot) {
//         if (snapShot.hasData) {
//           tmpUser = UserModel.fromJson(
//               snapShot.data?.docs.first.data() as Map<String, dynamic>);
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 const AlemniAppBar(title: "Edit Profile"),
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: ChangeNotifierProvider(
//                     create: (BuildContext context) => EditProfileController(),
//                     child: Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () async {
//                             XFile? xImg = await ImagePicker()
//                                 .pickImage(source: ImageSource.gallery);

//                             if (xImg == null) return;
//                             final image = File(xImg.path);
//                             showLoadingDialog(context);
//                             final url =
//                                 await FirebaseAuthServices().uploadImage(image);
//                             tmpUser.image = url;
//                             EditProfileController.imageUrl = url;
//                             Navigator.pop(context);
//                             setState(() {});
//                           },
//                           child: Stack(
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor:
//                                     Theme.of(context).colorScheme.primary,
//                                 radius: 32,
//                                 child: tmpUser.image != null
//                                     ? CircleAvatar(
//                                         radius: 30.w,
//                                         backgroundImage:
//                                             NetworkImage(tmpUser.image),
//                                       )
//                                     : CircleAvatar(
//                                         radius: 26.w,
//                                         backgroundImage:
//                                             const AssetImage(AppImages.avatar),
//                                       ),
//                               ),
//                               Positioned(
//                                   right: -15,
//                                   top: 20.h,
//                                   child: IconButton(
//                                     onPressed: () async {
//                                       await EditProfileController().takeImage();
//                                     },
//                                     icon: Icon(
//                                       Icons.edit_outlined,
//                                       color: AppColors.curveSecondary,
//                                     ),
//                                   ))
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 20.h),
//                         DefaultFormField(
//                           tittle: "First name",
//                           width: MediaQuery.of(context).size.width,
//                           height: 45,
//                           initValue: "${tmpUser.name}",
//                           onChange: (val) {
//                             firstName = val;
//                           },
//                           validate: (value) {
//                             if (value!.isEmpty) {
//                               return 'You should enter first name';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 20.h),
//                         DefaultFormField(
//                             tittle: "Email",
//                             width: MediaQuery.of(context).size.width,
//                             height: 45.h,
//                             initValue: "${tmpUser.email}",
//                             onChange: (val) {
//                               email = val;
//                             },
//                             validate: (value) {
//                               if (value!.isEmpty) {
//                                 return 'You should enter email';
//                               }
//                               return null;
//                             }),
//                         SizedBox(height: 20.h),
//                         Consumer<EditProfileController>(
//                           builder:
//                               (BuildContext context, value, Widget? child) =>
//                                   DefaultFormField(
//                             tittle: "Password",
//                             width: MediaQuery.of(context).size.width,
//                             height: 45.h,
//                             onChange: (val) {
//                               password = val;
//                             },
//                             initValue: "${tmpUser.password}",
//                             validate: (value) {
//                               if (value!.isEmpty) {
//                                 return 'You should enter password';
//                               }
//                               return null;
//                             },
//                             suffix: EditProfileController.obSecurePassword
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.remove_red_eye_outlined,
//                             isPassword: true,
//                             obSecure: EditProfileController.obSecurePassword,
//                             suffixButtonPressed: () {
//                               value.changeObSecurePassword();
//                             },
//                           ),
//                         ),
//                         SizedBox(height: 20.h),
//                         Consumer<EditProfileController>(
//                           builder:
//                               (BuildContext context, value, Widget? child) =>
//                                   DefaultFormField(
//                             tittle: "Confirm Password",
//                             width: MediaQuery.of(context).size.width,
//                             height: 45.h,
//                             onChange: (val) {
//                               confirmPassword = val;
//                             },
//                             initValue: "${tmpUser.password}",
//                             validate: (value) {
//                               return null;
//                             },
//                             suffix:
//                                 EditProfileController.obSecureConfirmPassword
//                                     ? Icons.visibility_off_outlined
//                                     : Icons.remove_red_eye_outlined,
//                             isPassword: true,
//                             obSecure:
//                                 EditProfileController.obSecureConfirmPassword,
//                             suffixButtonPressed: () {
//                               value.changeObSecureConfirmPassword();
//                             },
//                           ),
//                         ),
//                         SizedBox(height: 35.h),
//                         DefaultButton(
//                           onPressed: () async {
//                             userInfoReference;
//                             log(firstName);
//                             await userInfoReference
//                                 .doc(snapShot.data!.docs[0].id)
//                                 .update({
//                               'first_name': firstName,
//                               'last_name': lastName,
//                               'email': email,
//                               'password': password,
//                               'confirm_password': confirmPassword,
//                             });

//                             await userInfoReference
//                                 .doc(snapShot.data!.docs[0].id)
//                                 .update({
//                               "image": EditProfileController.imageUrl,
//                             });

//                             Navigator.pop(context);
//                           },
//                           width: 300.w,
//                           height: 50.h,
//                           backgroundColor:
//                               Theme.of(context).colorScheme.primary,
//                           text: "Confirm",
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w500,
//                           borderRadius: 15,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//         if (snapShot.hasError) {
//           log("============has Error===========");
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     ));
//   }
// }
