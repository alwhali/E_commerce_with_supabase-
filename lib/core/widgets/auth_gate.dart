import 'package:e_commerce_app/core/widgets/auth_loading_screen.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:e_commerce_app/views/nav_bar/ui/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, MyAuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          // Show the splash screen while the app resolves the initial auth state.
          return const AuthLoadingScreen();
        }
        // Authenticated: show the main app shell.
        if (state is AuthUnauthenticated ||
            Supabase.instance.client.auth.currentUser == null) {
          return const LoginScreen();
        }
        // Unauthenticated: show the login screen.

        return const MainHomeView();
      },
    );
  }
}
