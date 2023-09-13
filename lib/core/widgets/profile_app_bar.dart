import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference userInfoReference =
        FirebaseFirestore.instance.collection('users_info');

    return Container(
      width: 400,
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
      child: StreamBuilder(
        stream: userInfoReference
            .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            Map userData = snapShot.data!.docs[0].data() as Map;
            return Row(
              children: [
                SizedBox(width: 50.w),
                userData['image_profile_rul'] != null
                    ? CircleAvatar(
                        radius: 22.r,
                        backgroundImage:
                            NetworkImage(userData['image_profile_rul']),
                      )
                    : CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 23.r,
                        child: CircleAvatar(
                          radius: 22.r,
                          backgroundImage: const AssetImage(AppImages.avatar),
                        ),
                      ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${userData['first_name']} ${userData['last_name']}",
                      style: AppStyles.textStyle18,
                    ),
                    Text(
                      "Astronaut",
                      style: AppStyles.textStyle12.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                // Consumer<ThemeController>(
                //   builder: (context, provider, child) => Switch(
                //       value: provider.index,
                //       onChanged: (value) {
                //         provider.toggleTheme(value);
                //         print("==============$value=================");
                //       }),
                // ),
              ],
            );
          }
          if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          } else {
            return const Text("data");
          }
        },
      ),
    );
  }
}
