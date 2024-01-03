import 'package:finjoy_app/core/app_image.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "",
    image: '${AppImages.onboardingimages}onboard3.png',
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Non, justo, sed facilisi et.",
  ),
  OnboardingContents(
    title: "",
    image: '${AppImages.onboardingimages}onboard.png',
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Non, justo, sed facilisi et.",
  ),
  OnboardingContents(
    title: "",
    image: '${AppImages.onboardingimages}onboard1.png',
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Non, justo, sed facilisi et.",
  ),
  OnboardingContents(
    title: "",
    image: '${AppImages.onboardingimages}onboard2.png',
    desc:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio. Non, justo, sed facilisi et.",
  ),
];
