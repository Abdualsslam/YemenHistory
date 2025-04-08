import 'package:flutter/material.dart';
import 'package:yemenhistory/core/utils/app_text_styles.dart';
import 'package:yemenhistory/featuers/on_boarding/data/model/onboarding_model.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/widgets/custom_smooth_page_indicator.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody({super.key, required this.controller, this.onPageChanged});
  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: controller,
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 290,
                width: 343,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(onboardingData[index].image), // AssetImage
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              CustomSmoothPageIndicator(controller: controller),
              const SizedBox(height: 24),
              Text(
                onboardingData[index].title,
                style: CustomTextStyles.poppins500style24.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text(
                onboardingData[index].description,
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}
