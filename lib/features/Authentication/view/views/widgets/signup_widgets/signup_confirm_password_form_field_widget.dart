import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/Authentication/view/view_model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupConfirmPasswordFormFieldWidget extends StatelessWidget {
  const SignupConfirmPasswordFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (
        BuildContext context,
        provider,
        Widget? child,
      ) =>
          DefaultFormField(
        tittle: "Confirm Password",
        width: 300,
        height: 45,
        controller: AuthController.confirmPasswordController,
        type: TextInputType.name,
        validate: (value) {
          if (value!.isEmpty) {
            return 'You should enter confirm password';
          }
          return null;
        },
        suffix: AuthController.obSecureConfirmPassword
            ? Icons.visibility_off_outlined
            : Icons.remove_red_eye_outlined,
        isPassword: true,
        obSecure: AuthController.obSecureConfirmPassword,
        suffixButtonPressed: () {
          provider.changeObSecureConfirmPassword();
        },
      ),
    );
  }
}
