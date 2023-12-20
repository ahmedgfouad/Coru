import 'package:elearning_app/core/widgets/default_app_bar.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/profile/view_model/edit_profile_controller.dart';
import 'package:elearning_app/features/profile/view/views/widgets/edit_profile_widgets/confirm_button_widget.dart';
import 'package:elearning_app/features/profile/view/views/widgets/edit_profile_widgets/confirm_password_form_field_widget.dart';
import 'package:elearning_app/features/profile/view/views/widgets/edit_profile_widgets/email_form_field_widget.dart';
import 'package:elearning_app/features/profile/view/views/widgets/edit_profile_widgets/first_last_name_form_field_widget.dart';
import 'package:elearning_app/features/profile/view/views/widgets/edit_profile_widgets/password_form_field_widget.dart';
import 'package:elearning_app/features/profile/view/views/widgets/edit_profile_widgets/profile_picture_widget.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
             DefaultAppBar(title: S.of(context).edit_profile),
            Padding(
                padding: const EdgeInsets.all(20),
                child: StreamBuilder(
                  stream:
                      Provider.of<EditProfileController>(context, listen: false)
                          .getUserDataById()
                          .asStream(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<dynamic> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      UserInfoModel userData = snapshot.data;
                      return Column(
                        children: [
                          ProfilePictureWidger(userData: userData),
                          const SizedBox(height: 15),
                          FirstAndLastNameEditProfileWidet(userData: userData),
                          const SizedBox(height: 10),
                          EmailFormFieldEditProfileWidget(userData: userData),
                          const SizedBox(height: 20),
                          PasswordFormFieldEditProfileWidget(
                              userData: userData),
                          const SizedBox(height: 10),
                          ConfirmPasswordFormFieldEditProfileWidget(
                              userData: userData),
                          const SizedBox(height: 10),
                          const ConfirmButtonEditProfileWidget(),
                        ],
                      );
                    }
                    if (snapshot.hasError) {
                      return const Text("error");
                    }
                    return const CircularProgressIndicator();
                  },
                )),
          ],
        ),
      ),
    );
  }
} 