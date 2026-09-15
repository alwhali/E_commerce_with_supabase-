import 'package:e_commerce_app/core/functions/navigate/class_my_navigate.dart';
import 'package:e_commerce_app/views/auth/ui/forget_view.dart';
import 'package:e_commerce_app/views/auth/ui/signup_view.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_away_to_login.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_btn.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_field.dart';
import 'package:e_commerce_app/views/home/ui/home_screen.dart';
import 'package:e_commerce_app/views/nav_bar/ui/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(height: 100),
                const Text(
                  'Welcome to E_commerce_app',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                Card(
                  color: AppColors.kWhiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                      bottom: 10,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Column(
                      children: [
                        //Email field
                        CustomTextField(
                          lableText: "Email",
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(height: 30),
                        //Password field
                        CustomTextField(
                          lableText: "Password",
                          keyboardType: TextInputType.text,
                          suffixIcon: IconButton(
                            icon: isObscure
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                          isObscure: isObscure,
                        ),
                        const SizedBox(height: 10),
                        //Forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomTextBtn(
                              text: "Forgot password ?",
                              onTap: () {
                                MyNavigate.navigateTo(context, ForgetView());
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        //Login and Login with Google
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              //Login
                              CustomAwayToLogin(
                                awayToLoginText: "Login",
                                onPressed: () {
                                  MyNavigate.navigateTo(
                                    context,
                                    MainHomeView(),
                                  );
                                },
                              ),
                              SizedBox(height: 30),
                              //Login with Google
                              CustomAwayToLogin(
                                awayToLoginText: "Login with Google",
                                onPressed: () {},
                              ),
                              SizedBox(height: 40),
                              //Already have an account?
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      color: AppColors.kBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  CustomTextBtn(
                                    text: "Sign up",
                                    onTap: () {
                                      MyNavigate.navigateTo(
                                        context,
                                        SignUpScreen(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
