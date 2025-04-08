import 'package:go_router/go_router.dart';
import 'package:yemenhistory/featuers/auth/presentation/views/sign_in.dart';
import 'package:yemenhistory/featuers/auth/presentation/views/sign_up.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:yemenhistory/featuers/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: '/onBoarding', builder: (context, state) => const OnBoardingView()),
    GoRoute(path: '/signUp', builder: (context, state) => const SignUpView()),
    GoRoute(path: '/signIn', builder: (context, state) => const SignInView()),
  ],
);
