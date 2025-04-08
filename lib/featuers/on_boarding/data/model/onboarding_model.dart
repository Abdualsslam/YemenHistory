import 'package:yemenhistory/core/utils/app_assets.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({required this.image, required this.title, required this.description});

  // Map<String, dynamic> toJson() {
  //   return {
  //     'image': image,
  //     'title': title,
  //     'body': description,
  //   };
  // }

  // factory OnboardingModel.fromJson(Map<String, dynamic> json) {
  //   return OnboardingModel(
  //     image: json['image'],
  //     title: json['title'],
  //     description: json['body'],
  //   );
  // }
}

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: Assets.imagesOnBoarding,
    title: 'Explore Data 1',
    description: 'Explore data explore data explore data explore data explore data',
  ),
  OnboardingModel(
    image: Assets.imagesOnBoarding1,
    title: 'Explore Data 2',
    description: 'Explore data explore data explore data explore data explore data',
  ),
  OnboardingModel(
    image: Assets.imagesOnBoarding2,
    title: 'Explore Data 3',
    description: 'Explore data explore data explore data explore data explore data',
  ),
];
