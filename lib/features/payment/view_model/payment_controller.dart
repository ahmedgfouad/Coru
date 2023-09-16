import 'package:elearning_app/core/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class PaymentController {
  Map paymentInfo = {
    "0": [AppImages.facebook, "Paypal"],
    "1": [AppImages.facebook, "Google Pay"],
    "2": [AppImages.facebook, "Apple Pay"],
    "3": [AppImages.facebook, "Mastercard"],
  };
}
