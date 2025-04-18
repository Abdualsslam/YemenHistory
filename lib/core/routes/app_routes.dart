import 'package:go_router/go_router.dart';
import 'package:yemenhistory/featuers/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:yemenhistory/featuers/auth/presentation/views/sign_in_view.dart';
import 'package:yemenhistory/featuers/auth/presentation/views/sign_up_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemenhistory/featuers/home/presentation/views/home.dart';
import 'package:yemenhistory/featuers/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:yemenhistory/featuers/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: '/onBoarding', builder: (context, state) => const OnBoardingView()),
    GoRoute(path: "/signUp", builder: (context, state) => BlocProvider(create: (context) => AuthCubit(), child: const SignUpView())),
    GoRoute(path: "/signIn", builder: (context, state) => BlocProvider(create: (context) => AuthCubit(), child: const SignInView())),
    GoRoute(path: "/home", builder: (context, state) => const HomeView()),
  ],
);
