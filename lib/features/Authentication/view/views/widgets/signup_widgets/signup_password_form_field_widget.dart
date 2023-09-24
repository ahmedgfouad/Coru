import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/Authentication/view/view_model/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPasswordFormFieldWidget extends StatelessWidget {
  const SignupPasswordFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(
      builder: (
        BuildContext context,
        provider,
        Widget? child,
      ) =>
          DefaultFormField(
        tittle: "Password",
        width: 300,
        height: 45,
        controller: SignUpController.passwordController,
        type: TextInputType.name,
        validate: (value) {
          if (value!.isEmpty) {
            return 'You should enter password';
          }
          return null;
        },
        suffix: SignUpController.obSecurePassword
            ? Icons.visibility_off_outlined
            : Icons.remove_red_eye_outlined,
        isPassword: true,
        obSecure: SignUpController.obSecurePassword,
        suffixButtonPressed: () {
          provider.changeObSecurePassword();
        },
      ),
    );
  }
}
