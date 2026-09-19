part of 'authentication_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthenticationInitial extends AuthState {}

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
