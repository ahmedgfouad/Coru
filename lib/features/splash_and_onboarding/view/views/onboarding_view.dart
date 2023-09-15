import 'package:elearning_app/core/utilities/colors.dart';
import 'package:elearning_app/core/widgets/default_button.dart';
import 'package:elearning_app/features/splash_and_onboarding/view/view_model/onboarding_controller.dart';
import 'package:elearning_app/features/splash_and_onboarding/view/views/widgets/onboarding_curve_widget.dart';
import 'package:elearning_app/routing/navigator.dart';
import 'package:elearning_app/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int curentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    curentIndex = index;
                  });
                },
                itemBuilder: (_, i) => Column(
                  children: [
                    const OnboardingCurveWidget(),
                    SvgPicture.asset(
                      contents[i].image,
                      height: 300,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      contents[i].discription,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
            const SizedBox(height: 10),
            DefaultButton(
              onPressed: () {
                if (curentIndex == contents.length - 1) {
                  AppRoutes.pushNamedNavigator(
                    routeName: Routes.signUp,
                  );
                }
                _controller!.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              width: MediaQuery.of(context).size.width / 1.5,
              height: 40,
              backgroundColor: AppColors.primaryColor,
              text: curentIndex == contents.length - 1 ? "Continue" : "Next",
              borderRadius: 15,
            ),
            // const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 7,
      width: curentIndex == index ? 25 : 7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
    );
  }
}
