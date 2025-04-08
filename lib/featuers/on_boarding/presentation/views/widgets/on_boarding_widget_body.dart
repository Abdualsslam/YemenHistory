import 'package:flutter/material.dart';
import 'package:yemenhistory/core/utils/app_assets.dart';
import 'package:yemenhistory/core/utils/app_text_styles.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/widgets/custom_smooth_page_indicator.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody({super.key});
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(Assets.imagesOnBoarding1),
              const SizedBox(height: 24),
              CustomSmoothPageIndicator(controller: controller),
              const SizedBox(height: 24),
              Text(
                'explore data explore data explore data explore data explore data',
                style: CustomTextStyles.poppins500style24.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'explore data explore data explore data explore data explore data',
                style: CustomTextStyles.poppins300style16,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
