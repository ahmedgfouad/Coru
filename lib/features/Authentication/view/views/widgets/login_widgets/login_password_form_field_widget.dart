import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/Authentication/view/view_model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPasswordFormFieldWidget extends StatelessWidget {
  const LoginPasswordFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (
        BuildContext context,
        value,
        Widget? child,
      ) =>
          DefaultFormField(
        tittle: "Password",
        width: 300,
        height: 45,
        controller: AuthController.passwordController,
        type: TextInputType.name,
        validate: (value) {
          if (value!.isEmpty) {
            return 'You should enter password';
          }
          return null;
        },
        suffix: AuthController.obSecurePassword
            ? Icons.visibility_off_outlined
            : Icons.remove_red_eye_outlined,
        isPassword: true,
        obSecure: AuthController.obSecurePassword,
        suffixButtonPressed: () {
          value.changeObSecurePassword();
        },
      ),
    );
  }
}
