import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/profile/view_model/edit_profile_controller.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordFormFieldEditProfileWidget extends StatelessWidget {
  const PasswordFormFieldEditProfileWidget({
    super.key,
    required this.userData,
  });

  final UserInfoModel? userData;

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileController>(
      builder: (
        BuildContext context,
        provider,
        Widget? child,
      ) =>
          DefaultFormField(
        textColor: Theme.of(context).colorScheme.background,
        tittle: S.of(context).password,
        width: 300,
        height: 45,
        onChange: (val) {
          provider.changePassword(password: val!);
        },
        initValue: userData!.password,
        validate: (val) {
          return null;
        },
        suffix: provider.obSecurePassword
            ? Icons.visibility_off_outlined
            : Icons.remove_red_eye_outlined,
        isPassword: true,
        obSecure: provider.obSecurePassword,
        suffixButtonPressed: () {
          provider.changeObSecurePassword();
        },
      ),
    );
  }
}
