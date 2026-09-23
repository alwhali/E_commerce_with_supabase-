import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
part 'authentication_state.dart';

class AuthCubit extends Cubit<MyAuthState> {
  AuthCubit() : super(AuthInitial()) {
    initialize();
  }
  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await client.auth.signInWithPassword(email: email, password: password);
      emit(LoginSuccess());
    } on AuthException catch (e) {
      emit(LoginFailure(error: e.message));
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    try {
      await client.auth.signUp(email: email, password: password);
      await addUser(name: name, email: email);
      emit(SignUpSuccess());
    } on AuthException catch (e) {
      emit(SignUpFailure(error: e.message));
    } catch (e) {
      emit(SignUpFailure(error: e.toString()));
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<void> initialize() async {
    const webClientId =
        '908043366398-bkkm41a6mphbv4vt89vl8csfvb0pgb88.apps.googleusercontent.com';

    // const iosClientId =
    //     'YOUR_IOS_CLIENT_ID.apps.googleusercontent.com';

    await _googleSignIn.initialize(
      // clientId: iosClientId,
      serverClientId: webClientId,
    );
  }

  Future<AuthResponse> signInWithGoogle() async {
    emit(GoogelSignInLoading());
    try {
      // initialize();
      final googleUser = await _googleSignIn.authenticate();
      // final googleUser = await _googleSignIn.signIn();

      final googleAuth = googleUser.authentication;

      final googleAuthorization = await googleUser.authorizationClient
          .authorizationForScopes(['email']);

      final idToken = googleAuth.idToken;
      final accessToken = googleAuthorization?.accessToken;

      if (idToken == null) {
        emit(GoogelSignInFailure(error: 'No ID Token found.'));
        throw Exception('No ID Token found.');
        // return AuthResponse();
      }

      if (accessToken == null) {
        emit(GoogelSignInFailure(error: 'No Access Token found.'));
        throw Exception('No Access Token found.');
        // return AuthResponse();
      }

      AuthResponse response = await client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      emit(GoogelSignInSuccess());
      return response;
    } on Exception catch (e) {
      // TODO
      emit(GoogelSignInFailure(error: e.toString()));
      return AuthResponse();
      // throw Exception('there is an error in signInWithGoogle');
    }
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    try {
      await client.auth.signOut();
      emit(SignOutSuccess());
    } on AuthException catch (e) {
      emit(SignOutFailure(error: e.message));
    } catch (e) {
      emit(SignOutFailure(error: e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(SendToEmailLoading());
    try {
      // await client.auth.resetPasswordForEmail(email);
      // await client.auth.resend(type: OtpType.signup, email: email);
      await client.auth.resetPasswordForEmail(
        email,
        redirectTo: "myapp://reset-password",
      );

      emit(SendToEmailSuccess());
    } on AuthException catch (e) {
      emit(SendToEmailFailure(error: e.message));
    } catch (e) {
      emit(SendToEmailFailure(error: e.toString()));
    }
  }

  Future<void> updatePassword(String password) async {
    try {
      emit(SendToEmailLoading());
      await client.auth.updateUser(UserAttributes(password: password));
      emit(UpdatePasswordSuccess());
    } on Exception catch (e) {
      // TODO
      emit(UpdatePasswordFailure(error: e.toString()));
    }
  }

  Future<void> addUser({required String name, required String email}) async {
    emit(AddUserLoading());
    try {
      await client.from('users').insert({
        "user_id": client.auth.currentUser!.id,
        "name": name,
        "email": email,
      });
      emit(AddUserSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(AddUserFailure(error: e.toString()));
    }
  }
}
