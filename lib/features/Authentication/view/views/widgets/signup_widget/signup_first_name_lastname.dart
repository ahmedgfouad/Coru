import 'package:elearning_app/core/widgets/default_text_form_field.dart';
import 'package:elearning_app/features/Authentication/view/view_model/signup_controller.dart';
import 'package:flutter/material.dart';

class SignupFirstNameAndLastNameWidget extends StatelessWidget {
  const SignupFirstNameAndLastNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultFormField(
            tittle: "First name",
            width: 130,
            height: 45,
            controller: SignUpController.firstNameController,
            type: TextInputType.name,
            validate: (value) {
              if (value!.isEmpty) {
                return 'You should enter first name';
              }
              return null;
            }),
        DefaultFormField(
            tittle: "Last name",
            width: 130,
            height: 45,
            controller: SignUpController.lastNameController,
            type: TextInputType.name,
            validate: (value) {
              if (value!.isEmpty) {
                return 'You should enter last name';
              }
              return null;
            }),
      ],
    );
  }
}
