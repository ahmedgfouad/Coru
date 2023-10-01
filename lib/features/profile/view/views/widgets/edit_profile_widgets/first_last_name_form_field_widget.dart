import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FirstAndLastNameEditProfileWidet extends StatelessWidget {
  const FirstAndLastNameEditProfileWidet({
    super.key,
    required this.userData,
  });

  final UserInfoModel? userData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultFormField(
          tittle: "First name",
          width: 130.w,
          height: 45.h,
          initValue: userData!.firstName,
          onChange: (val) {
            Provider.of<EditProfileController>(context, listen: false)
                .changeFirstName(firstName: val!);
          },
          validate: (value) {
            // if (value!.isEmpty) {
            //   return 'You should enter first name';
            // }
            return null;
          },
        ),
        DefaultFormField(
            tittle: "Last name",
            width: 130,
            height: 45,
            initValue: userData!.lasttName,
            onChange: (val) {
              Provider.of<EditProfileController>(context, listen: false)
                  .changeLastName(lastName: val!);
            },
            validate: (value) {
              // if (value!.isEmpty) {
              //   return 'You should enter last name';
              // }
              return null;
            }),
      ],
    );
  }
}
