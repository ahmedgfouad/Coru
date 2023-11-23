// ignore_for_file: use_build_context_synchronously

import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/features/profile/view/view_model/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmButtonEditProfileWidget extends StatelessWidget {
  const ConfirmButtonEditProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileController>(
      builder: (
        BuildContext context,
        EditProfileController provider,
        Widget? child,
      ) =>
          DefaultButton(
        onPressed: () async {
          await provider.editProfileInfo();
          Navigator.pop(context);
        },
        width: 300,
        height: 45,
        backgroundColor: AppColors.primaryColor,
        text: "Confirm",
        borderRadius: 15,
      ),
    );
  }
}
