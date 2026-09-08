import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/views/auth/ui/forget_view.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:e_commerce_app/views/nav_bar/ui/main_home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E_commerce_app',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColors.kScaffoldColor,
        appBarTheme: const AppBarTheme(color: AppColors.kScaffoldColor),
      ),

      home: MainHomeView(),
    );
  }
}
