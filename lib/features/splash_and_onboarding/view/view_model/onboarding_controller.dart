import 'package:elearning_app/core/utilities/images.dart';

class OnboardingContent {
  String image;
  String discription;

  OnboardingContent({required this.image, required this.discription});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    image: AppImages.onBoarding1,
    discription: 'Lorem ipsum dolor sit amet, '
        'consectetur adipiscing elit. Duis vel, '
        'placerat scelerisque sagittis leo. ',
  ),
  OnboardingContent(
    image: AppImages.onBoarding2,
    discription: 'Lorem ipsum dolor sit amet, '
        'consectetur adipiscing elit. Duis vel, '
        'placerat scelerisque sagittis leo. ',
  ),
  OnboardingContent(
    image: AppImages.onBoarding3,
    discription: 'Lorem ipsum dolor sit amet, '
        'consectetur adipiscing elit. Duis vel, '
        'placerat scelerisque sagittis leo. ',
  ),
];
