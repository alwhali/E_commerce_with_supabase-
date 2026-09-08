import 'package:e_commerce_app/core/functions/navigate/class_my_navigate.dart';
import 'package:e_commerce_app/views/auth/ui/forget_view.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_away_to_login.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_btn.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                SizedBox(height: 50),
                const Text(
                  'Sign Up',
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
                        CustomTextField(
                          lableText: "Name",
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 30),
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
                        SizedBox(height: 30),
                        //confirm password field
                        CustomTextField(
                          lableText: "Confirm Password",
                          keyboardType: TextInputType.text,

                          isObscure: isObscure,
                        ),
                        const SizedBox(height: 10),

                        //Forgot password
                        SizedBox(height: 30),
                        //Login and Login with Google
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              //Login
                              CustomAwayToLogin(
                                awayToLoginText: "Login",
                                onPressed: () {},
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
                                    "Already have an account?",
                                    style: TextStyle(
                                      color: AppColors.kBlackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  CustomTextBtn(
                                    text: "Login",
                                    onTap: () {
                                      MyNavigate.navigateTo(
                                        context,
                                        LoginScreen(),
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
