import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGuard {
  static void requireAuthentication(
    BuildContext context, {
    required Widget protectedScreen,
    required String? redirectKey,
  }) {
    final cubit = context.read<AuthCubit>();

    if (!cubit.isAuthenticated) {
      // Redirect to LoginScreen, replacing the current route.
      // If redirectKey is provided, we stash it for later use.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
      return;
    }

    // Authenticated: allow the protected screen to be built.
    // (This method is typically used in a Scaffold's body or as a wrapper widget.)
    return;
  }
}
