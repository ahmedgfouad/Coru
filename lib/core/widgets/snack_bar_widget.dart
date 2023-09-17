import 'package:elearning_app/core/utilities/colors.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
            color: AppColors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
    ),
  );
}
