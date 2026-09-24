part of 'authentication_cubit.dart';

@immutable
sealed class MyAuthState {}

final class AuthInitial extends MyAuthState {}

final class LoginLoading extends MyAuthState {}

final class LoginSuccess extends MyAuthState {}

final class LoginFailure extends MyAuthState {
  final String error;
  LoginFailure({required this.error});
}

final class SignUpLoading extends MyAuthState {}

final class SignUpSuccess extends MyAuthState {}

final class SignUpFailure extends MyAuthState {
  final String error;
  SignUpFailure({required this.error});
}

final class GoogelSignInLoading extends MyAuthState {}

final class GoogelSignInSuccess extends MyAuthState {}

final class GoogelSignInFailure extends MyAuthState {
  final String error;
  GoogelSignInFailure({required this.error});
}

final class LogoutLoading extends MyAuthState {}

final class LogoutSuccess extends MyAuthState {}

final class LogoutFailure extends MyAuthState {
  final String error;
  LogoutFailure({required this.error});
}

final class SendToEmailLoading extends MyAuthState {}

final class SendToEmailSuccess extends MyAuthState {}

final class SendToEmailFailure extends MyAuthState {
  final String error;
  SendToEmailFailure({required this.error});
}

final class UpdatePasswordLoading extends MyAuthState {}

final class UpdatePasswordSuccess extends MyAuthState {}

final class UpdatePasswordFailure extends MyAuthState {
  final String error;
  UpdatePasswordFailure({required this.error});
}

final class AddUserLoading extends MyAuthState {}

final class AddUserSuccess extends MyAuthState {}

final class AddUserFailure extends MyAuthState {
  final String error;
  AddUserFailure({required this.error});
}

final class GetUserDataLoading extends MyAuthState {}

final class GetUserDataSuccess extends MyAuthState {}

final class GetUserDataFailure extends MyAuthState {
  final String error;
  GetUserDataFailure({required this.error});
}
