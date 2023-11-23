import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class PaymentByPayBalWidget extends StatelessWidget {
  const PaymentByPayBalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaypalCheckout(
      sandboxMode: true,
      clientId:
          "AQyyqweDZLiu12BYStxFfWFzlnjDiH_jr0oxHJsECMGzTNT1a9c_Yx46-rXRqEQTIDoqrqUCvR9W4WiI",
      secretKey:
          "EPXd4jeDEiRbAcFDwyzuIQkAGqsFvJyfdKHMZAgNP6FKnCQ9sv2f20uLq-t4IDkCM0SBB-n0rSwgZaBY",
      returnURL: "success.snippetcoder.com",
      cancelURL: "cancel.snippetcoder.com",
      transactions: const [
        {
          "amount": {
            "total": '70',
            "currency": "USD",
            "details": {
              "subtotal": '70',
              "shipping": '0',
              "shipping_discount": 0
            }
          },
          "description": "The payment transaction description.",
          // "payment_options": {
          //   "allowed_payment_method":
          //       "INSTANT_FUNDING_SOURCE"
          // },
          "item_list": {
            "items": [
              {"name": "Apple", "quantity": 4, "price": '5', "currency": "USD"},
              {
                "name": "Pineapple",
                "quantity": 5,
                "price": '10',
                "currency": "USD"
              }
            ],

            // shipping address is not required though
            //   "shipping_address": {
            //     "recipient_name": "Raman Singh",
            //     "line1": "Delhi",
            //     "line2": "",
            //     "city": "Delhi",
            //     "country_code": "IN",
            //     "postal_code": "11001",
            //     "phone": "+00000000",
            //     "state": "Texas"
            //  },
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        log("onSuccess: $params");
      },
      onError: (error) {
        log("onError: $error");
        Navigator.pop(context);
      },
      onCancel: () {
        log('cancelled:');
      },
    );
  }
}
