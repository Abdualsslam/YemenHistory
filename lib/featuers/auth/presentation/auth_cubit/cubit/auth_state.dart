part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignupLoadingState extends AuthState {}

final class SignupSuccessState extends AuthState {}

final class SignupFailurState extends AuthState {
  final String error;

  SignupFailurState({required this.error});
}
