import 'dart:async';

import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/functions/deep_link_service.dart';
import 'package:e_commerce_app/core/my_observer.dart';
import 'package:e_commerce_app/secret.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/expired_reset_password_view.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:e_commerce_app/views/auth/ui/reset_password_view.dart';
import 'package:e_commerce_app/views/nav_bar/ui/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, publishableKey: publishableKey);
  Bloc.observer = MyObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final DeepLinkService _deepLinkService = DeepLinkService();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  StreamSubscription<AuthState>? _authSubscription;

  @override
  void initState() {
    super.initState();
    _initializeDeepLinks();
    _initializeAuthListener();
  }

  Future<void> _initializeDeepLinks() async {
    await _deepLinkService.initialize(onLink: _handleDeepLink);
  }

  void _handleDeepLink(Uri uri) {
    debugPrint('Received URI: $uri');

    if (uri.scheme != 'myapp' || uri.host != 'reset-password') {
      return;
    }
    final queryParams = uri.queryParameters;
    // Supabase may place error parameters in the fragment.
    final fragmentParams = _parseFragment(uri.fragment);
    final errorCode = queryParams['error_code'] ?? fragmentParams['error_code'];
    final errorDescription =
        queryParams['error_description'] ?? fragmentParams['error_description'];
    if (errorCode == 'otp_expired') {
      debugPrint('Password reset link expired: $errorDescription');
      _showExpiredLinkMessage();
      return;
    }
    // debugPrint('Valid-looking recovery URI received');
  }

  void _showExpiredLinkMessage() {
    navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => const ExpiredResetLinkScreen()),
    );
  }

  Map<String, String> _parseFragment(String fragment) {
    if (fragment.isEmpty) {
      return {};
    }

    try {
      return Uri.splitQueryString(fragment);
    } catch (_) {
      return {};
    }
  }

  void _initializeAuthListener() {
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      AuthState data,
    ) {
      final event = data.event;

      debugPrint('Auth event: $event');

      if (event == AuthChangeEvent.passwordRecovery) {
        navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (_) => const ResetPasswordScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'E_commerce_app',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: AppColors.kScaffoldColor,
          appBarTheme: const AppBarTheme(
            color: AppColors.kPrimaryColor,
            foregroundColor: AppColors.kWhiteColor,
          ),
        ),

        home: client.auth.currentUser != null ? MainHomeView() : LoginScreen(),
      ),
    );
  }
}
