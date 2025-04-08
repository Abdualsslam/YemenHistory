import 'package:flutter/material.dart';
import 'package:yemenhistory/core/navigation/navigation.dart';
import 'package:yemenhistory/core/utils/app_strings.dart';
import 'package:yemenhistory/core/utils/app_text_styles.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    delayedNavagte(context);
    super.initState();
  }

  void delayedNavagte(context) {
    Future.delayed(const Duration(seconds: 2), () {
      customNavigate(context, '/onBoarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(AppStrings.SPLASH_SCREEN, style: CustomTextStyles.pacifico400style42)));
  }
}
// This is a placeholder for the splash screen view. You can customize it as needed.
// You can add a logo, animation, or any other content you want to display during the splash screen. 