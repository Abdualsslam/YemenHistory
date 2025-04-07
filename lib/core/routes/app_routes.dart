import 'package:go_router/go_router.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:yemenhistory/featuers/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashView()),
    GoRoute(path: '/onBoarding', builder: (context, state) => const OnBoardingView()),
    // GoRoute(path: 'home', builder: (context, state) => const HomeView()),
  ],
);
