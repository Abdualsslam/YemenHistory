import 'package:flutter/material.dart';
import 'package:yemenhistory/core/navigation/navigation.dart';
import 'package:yemenhistory/core/utils/app_strings.dart';
import 'package:yemenhistory/featuers/auth/presentation/widgets/custom_signup_form.dart';
import 'package:yemenhistory/featuers/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:yemenhistory/featuers/auth/presentation/widgets/welcome_text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 152)),
            const SliverToBoxAdapter(child: WelcomeTextWidget(text: AppStrings.welcome)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: CustomSignUpForm()),
            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                text1: AppStrings.alreadyHaveAnAccount,
                text2: AppStrings.signIn,
                onTap: () {
                  customNavigate(context, "/signIn");
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
