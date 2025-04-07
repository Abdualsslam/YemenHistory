import 'package:go_router/go_router.dart';
import 'package:yemenhistory/featuers/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    // GoRoute(path: 'home', builder: (context, state) => const HomeView()),
  ],
);
