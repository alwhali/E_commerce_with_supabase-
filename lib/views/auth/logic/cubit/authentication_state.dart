part of 'authentication_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {
  final String error;
  LoginFailure({required this.error});
}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String error;
  SignUpFailure({required this.error});
}

final class GoogelSignInLoading extends AuthState {}

final class GoogelSignInSuccess extends AuthState {}

final class GoogelSignInFailure extends AuthState {
  final String error;
  GoogelSignInFailure({required this.error});
}
