import 'package:flutter/material.dart';
import 'package:yemenhistory/core/navigation/navigation.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/functions/on_boarding.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/widgets/on_boarding_btns.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;

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
                    CustomNavBar(
                      onTap: () {
                        onBoardingVisited();
                        customReplacementNavigate(context, '/signUp');
                      },
                    ),
                    OnBoardingWidgetBody(
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),

                    SizedBox(height: 124),
                    OnBoardingBtns(controller: _controller, currentIndex: currentIndex),
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
