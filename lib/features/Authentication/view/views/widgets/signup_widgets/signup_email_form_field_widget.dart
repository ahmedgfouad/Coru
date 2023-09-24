import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/Authentication/view/view_model/signup_controller.dart';
import 'package:flutter/material.dart';

class SignupEmailFormFieldWidget extends StatelessWidget {
  const SignupEmailFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
        tittle: "Email",
        width: 300,
        height: 45,
        controller: SignUpController.emailController,
        type: TextInputType.name,
        validate: (value) {
          if (value!.isEmpty) {
            return 'You should enter email';
          }
          return null;
        });
  }
}
