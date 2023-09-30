import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmPasswordFormFieldEditProfileWidget extends StatelessWidget {
  const ConfirmPasswordFormFieldEditProfileWidget({
    super.key,
    required this.userData,
  });

  final UserInfoModel? userData;

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileController>(
      builder: (
        BuildContext context,
        EditProfileController provider,
        Widget? child,
      ) =>
          DefaultFormField(
        tittle: "Confirm Password",
        width: 300,
        height: 45,
        onChange: (val) {
          provider.changeConfirmPassword(confirmPassword: val!);
        },
        initValue: userData!.confirmPassword,
        validate: (value) {
          // return null;
        },
        suffix: provider.obSecureConfirmPassword
            ? Icons.visibility_off_outlined
            : Icons.remove_red_eye_outlined,
        isPassword: true,
        obSecure: provider.obSecureConfirmPassword,
        suffixButtonPressed: () {
          provider.changeObSecureConfirmPassword();
        },
      ),
    );
  }
}
