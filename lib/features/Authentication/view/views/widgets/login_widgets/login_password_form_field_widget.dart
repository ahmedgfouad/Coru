import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/Authentication/view/view_model/logIn_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPasswordFormFieldWidget extends StatelessWidget {
  const LoginPasswordFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LogInController>(
      builder: (
        BuildContext context,
        value,
        Widget? child,
      ) =>
          DefaultFormField(
        tittle: "Password",
        width: 300,
        height: 45,
        controller: LogInController.passwordController,
        type: TextInputType.name,
        validate: (value) {
          if (value!.isEmpty) {
            return 'You should enter password';
          }
          return null;
        },
        suffix: LogInController.obSecure
            ? Icons.visibility_off_outlined
            : Icons.remove_red_eye_outlined,
        isPassword: true,
        obSecure: LogInController.obSecure,
        suffixButtonPressed: () {
          value.changeObSecure();
        },
      ),
    );
  }
}
