import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/my_observer.dart';
import 'package:e_commerce_app/secret.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:e_commerce_app/views/home/ui/home_screen.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SupabaseClient client = Supabase.instance.client;
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
