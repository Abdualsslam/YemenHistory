import 'package:flutter/material.dart';
import 'package:yemenhistory/core/database/cache/cache_helper.dart';
import 'package:yemenhistory/core/navigation/navigation.dart';
import 'package:yemenhistory/core/utils/app_strings.dart';
import 'package:yemenhistory/core/widgets/custom_btn.dart';
import 'package:yemenhistory/featuers/on_boarding/data/model/onboarding_model.dart';

class OnBoardingBtns extends StatelessWidget {
  const OnBoardingBtns({super.key, required this.controller, required this.currentIndex});
  final PageController controller;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == onboardingData.length - 1) {
      return Column(
        children: [
          CustomBtn(
            text: AppStrings.createAccount,
            onPressed: () {
              CacheHelper().saveData(key: 'visitedOnBoarding', value: true);
              customReplacementNavigate(context, '/SignUp');
            },
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              CacheHelper().saveData(key: 'visitedOnBoarding', value: true);
              customReplacementNavigate(context, '/signIn');
            },
            child: Text(AppStrings.loginNow),
          ),
        ],
      );
    } else {
      return CustomBtn(
        text: AppStrings.next,
        onPressed: () {
          controller.nextPage(duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
        },
      );
    }
  }
}
