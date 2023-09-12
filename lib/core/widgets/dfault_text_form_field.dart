// ignore_for_file: must_be_immutable

import 'package:elearning_app/core/utilities/colors.dart';
import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  late final String tittle;
  late final double width;
  late double height;
  TextEditingController? controller;
  TextInputType? type;
  final String? Function(String?)? validate;
  final String? hintText;
  bool? obSecure;
  IconData? prefix;
  IconData? suffix;
  TextStyle? textStyle;
  void Function()? suffixButtonPressed;
  bool isPassword;
  late final Color borderColor;
  late final Color cursorColor;
  late final Color textColor;
  String? initValue;
  final void Function(String?)? onChange;

  DefaultFormField({
    super.key,
    required this.tittle,
    required this.width,
    required this.height,
    this.controller,
    this.type,
    required this.validate,
    this.hintText,
    this.isPassword = false,
    this.suffixButtonPressed,
    this.obSecure,
    this.prefix,
    this.suffix,
    this.textStyle,
    this.borderColor = Colors.white,
    this.textColor = Colors.black,
    this.cursorColor = Colors.blue,
    this.initValue,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style: textStyle ??
              const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(
            initialValue: initValue,
            onChanged: onChange,
            style: TextStyle(color: textColor),
            cursorColor: cursorColor,
            keyboardType: type,
            controller: controller,
            obscureText: obSecure ?? false,
            validator: validate,
            decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                suffixIcon: isPassword == true
                    ? InkWell(
                        onTap: suffixButtonPressed,
                        child: Icon(
                          suffix,
                          size: 20,
                          color: AppColors.primaryColor,
                        ),
                      )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
