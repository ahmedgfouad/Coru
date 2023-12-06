import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/data/model/users_info/user_info_model.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:elearning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailFormFieldEditProfileWidget extends StatelessWidget {
  const EmailFormFieldEditProfileWidget({
    super.key,
    required this.userData,
  });

  final UserInfoModel? userData;

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      tittle: S.of(context).email,
      width: 300,
      height: 45,
      initValue: userData!.email,
      onChange: (val) {
        Provider.of<EditProfileController>(context, listen: false)
            .changeEmail(email: val!);
      },
      validate: (value) {
        return null;
      },
    );
  }
}
