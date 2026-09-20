import 'package:e_commerce_app/core/component/snackBarMessage.dart';
import 'package:e_commerce_app/core/functions/navigate/class_my_navigate.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_away_to_login.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_btn.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_field.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_field_confirmpass.dart';
import 'package:e_commerce_app/views/home/ui/home_screen.dart';
import 'package:e_commerce_app/views/nav_bar/ui/main_home_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmPasswordcontroller =
      TextEditingController();
  String password = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is SignUpSuccess) {
          MyNavigate.navigateAndReplacement(context, MainHomeView());
          snackBarMessage(context, "Sign Up Success , Login Now", Colors.green);
        }
        if (state is SignUpFailure) {
          snackBarMessage(context, state.error, Colors.red);
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: state is SignUpLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.kPrimaryColor,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            SizedBox(height: 50),
                            const Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
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
                                      controller: _namecontroller,
                                    ),
                                    SizedBox(height: 30),
                                    //Email field
                                    CustomTextField(
                                      lableText: "Email",
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailcontroller,
                                    ),
                                    SizedBox(height: 30),
                                    //Password field
                                    CustomTextField(
                                      lableText: "Password",
                                      keyboardType: TextInputType.text,
                                      controller: _passwordcontroller,
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
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
                                    CustomTextFieldConfirmPass(
                                      lableText: "Confirm Password",
                                      keyboardType: TextInputType.text,
                                      controller: _confirmPasswordcontroller,
                                      password: password,
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
                                            awayToLoginText: "SignUp",
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                context
                                                    .read<AuthCubit>()
                                                    .signUp(
                                                      name:
                                                          _namecontroller.text,
                                                      email:
                                                          _emailcontroller.text,
                                                      password:
                                                          _passwordcontroller
                                                              .text,
                                                    );
                                                // cubit.signUp(
                                                //   name: _namecontroller.text,
                                                //   email: _emailcontroller.text,
                                                //   password:
                                                //       _passwordcontroller.text,
                                                // );
                                              }
                                            },
                                          ),
                                          SizedBox(height: 30),
                                          //Login with Google
                                          CustomAwayToLogin(
                                            awayToLoginText:
                                                "Login with Google",
                                            onPressed: () {},
                                          ),
                                          SizedBox(height: 40),
                                          //Already have an account?
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                  Navigator.pop(context);
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
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmPasswordcontroller.dispose();
    super.dispose();
  }
}
