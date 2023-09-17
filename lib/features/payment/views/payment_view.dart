import 'package:elearning_app/features/payment/view_model/payment_controller.dart';
import 'package:elearning_app/features/payment/views/widgets/payment_card_option.dart';
import 'package:elearning_app/features/payment/views/widgets/paymet_by_paybal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentCardView extends StatelessWidget {
  const PaymentCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // const AlemniAppBar(
            //   title: 'Payment card ',
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 40.h,
                  ),
                  itemCount: PaymentController().paymentInfo.length,
                  // PaymentController().paymentInfo.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const PaymentByPayBalWidget(),
                        ),
                      );
                    },
                    child: CardOptionWidget(
                      cardImage:
                          PaymentController().paymentInfo[index.toString()][0],
                      cardName:
                          PaymentController().paymentInfo[index.toString()][1],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
