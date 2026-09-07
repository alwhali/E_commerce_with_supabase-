import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter/rendering.dart';

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: 20),
              const Text(
                'Welcome to E_commerce_app',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60),
              Card(
                color: AppColors.kWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 50,
                  ),
                  child: Column(
                    children: [
                      CustomTextField(lableText: "Email"),

                      SizedBox(height: 30),
                      CustomTextField(
                        lableText: "Password",
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
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password",
                      style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      color: AppColors.kBlackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Login With Google",
                    style: TextStyle(
                      color: AppColors.kBlackColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 70,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: AppColors.kBlackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Sign up",

                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.lableText,
    this.suffixIcon,
    this.isObscure = false,
  });
  bool isObscure;
  String lableText = " ";
  Widget? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password is required";
        }
        return null;
      },
      obscureText: widget.isObscure,
      decoration: InputDecoration(
        labelText: widget.lableText,
        suffixIcon: widget.suffixIcon,
        // hint: Text(
        //   "Password",
        //   style: TextStyle(fontSize: 18, color: Colors.grey),
        // ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kBordersideColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kBordersideColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.kPrimaryColor),
        ),

        // suffixIcon: IconButton(
        //   icon: suffixIcon ?? const Icon(Icons.remove_red_eye),
        //   onPressed: () {},
        // ),
      ),
    );
  }
}
