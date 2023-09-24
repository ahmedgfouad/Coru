import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/Authentication/view/view_model/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupConfirmPasswordFormFieldWidget extends StatelessWidget {
  const SignupConfirmPasswordFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(
      builder: (
        BuildContext context,
        provider,
        Widget? child,
      ) =>
          DefaultFormField(
        tittle: "Confirm Password",
        width: 300,
        height: 45,
        controller: SignUpController.confirmPasswordController,
        type: TextInputType.name,
        validate: (value) {
          if (value!.isEmpty) {
            return 'You should enter confirm password';
          }
          return null;
        },
        suffix: SignUpController.obSecureConfirmPassword
            ? Icons.visibility_off_outlined
            : Icons.remove_red_eye_outlined,
        isPassword: true,
        obSecure: SignUpController.obSecureConfirmPassword,
        suffixButtonPressed: () {
          provider.changeObSecureConfirmPassword();
        },
      ),
    );
  }
}
