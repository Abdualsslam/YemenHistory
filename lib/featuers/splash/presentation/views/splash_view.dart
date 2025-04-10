import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yemenhistory/core/database/cache/cache_helper.dart';
import 'package:yemenhistory/core/navigation/navigation.dart';
import 'package:yemenhistory/core/services/service_locator.dart';
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
    bool skip = getIt<CacheHelper>().getData(key: 'isOnBoardingVisited') ?? false;

    if (skip) {
      FirebaseAuth.instance.currentUser == null ? delayedNavagte(context, '/signIn') : delayedNavagte(context, '/home');
    } else {
      delayedNavagte(context, '/onBoarding');
    }
    super.initState();
  }

  void delayedNavagte(context, path) {
    Future.delayed(const Duration(seconds: 2), () {
      customReplacementNavigate(context, path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(AppStrings.SPLASH_SCREEN, style: CustomTextStyles.pacifico400style42)));
  }
}
// This is a placeholder for the splash screen view. You can customize it as needed.
// You can add a logo, animation, or any other content you want to display during the splash screen. 