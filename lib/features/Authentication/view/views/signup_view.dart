import 'package:elearning_app/core/utilities/images.dart';
import 'package:elearning_app/features/Authentication/view/view_model/signup_controller.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/accounts_icons.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/having_account_section.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/signup_widget/sign_up_button_action_widget.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/signup_widget/signup_confirm_password_form_field_widget.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/signup_widget/signup_email_form_field_widget.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/signup_widget/signup_first_name_lastname.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/signup_widget/signup_password_form_field_widget.dart';
import 'package:elearning_app/features/Authentication/view/views/widgets/user_guest_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ChangeNotifierProvider(
          create: (BuildContext context) => SignUpController(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: SignUpController.formStat,
              child: Column(
                children: [
                  const Text(
                    "Lets get Started",
                    style: TextStyle(fontSize: 30),
                  ),
                  SvgPicture.asset(AppImages.login, width: 133, height: 160),
                  const SignupAsGuestWidget(),
                  const SignupFirstNameAndLastNameWidget(),
                  const SizedBox(height: 10),
                  const SignupEmailFormFieldWidget(),
                  const SizedBox(height: 20),
                  const SignupPasswordFormFieldWidget(),
                  const SizedBox(height: 10),
                  const SignupConfirmPasswordFormFieldWidget(),
                  const SizedBox(height: 10),
                  const SignUpButtonActionWidget(),
                  const HavingAccountSectionWidet(),
                  AccountsIcons(onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
