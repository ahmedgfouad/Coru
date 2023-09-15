import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning_app/core/utilities/app_styles.dart';
import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/features/Authentication/view/view_model/guest_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference userInfoReference =
        FirebaseFirestore.instance.collection('users_info');

    return Center(
      child: Consumer<UserGusetController>(
        builder: (BuildContext context, provider, Widget? child) => Container(
          width: 390,
          height: 176,
          decoration: const BoxDecoration(
            color: AppColors.thirdColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
          ),
          child: provider.isGuest 
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 23.r,
                      child: CircleAvatar(
                        radius: 22.r,
                        backgroundImage: const AssetImage(AppImages.avatar),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "As a Guest",
                      style: AppStyles.textStyle18,
                    ),
                  ],
                )
              : StreamBuilder(
                  stream: userInfoReference
                      .where('user_id',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                                  backgroundImage: NetworkImage(
                                      userData['image_profile_rul']),
                                )
                              : CircleAvatar(
                                  backgroundColor: AppColors.primaryColor,
                                  radius: 23.r,
                                  child: CircleAvatar(
                                    radius: 22.r,
                                    backgroundImage:
                                        const AssetImage(AppImages.avatar),
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
                                style: AppStyles.textStyle14.copyWith(
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                    if (snapShot.hasError) {
                      return Text(snapShot.error.toString());
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
        ),
      ),
    );
  }
}
