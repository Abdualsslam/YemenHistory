import 'package:flutter/material.dart';
import 'package:yemenhistory/core/utils/app_strings.dart';
import 'package:yemenhistory/core/widgets/custom_btn.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 40),
                    CustomNavBar(),
                    OnBoardingWidgetBody(),
                    SizedBox(height: 124),
                    CustomBtn(text: AppStrings.next),
                    SizedBox(height: 32),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
