import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/snackBarMessage.dart';
import 'package:e_commerce_app/core/functions/navigate/class_my_navigate.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_ebtn.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_field.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_field_confirmpass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmPasswordcontroller =
      TextEditingController();
  String password = "";
  bool isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, MyAuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is UpdatePasswordSuccess) {
          Navigator.pop(context);
          snackBarMessage(context, "Password Reset Success ", Colors.green);
        }
        if (state is UpdatePasswordFailure) {
          snackBarMessage(context, state.error, Colors.red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
              ),
              child: state is UpdatePasswordLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            "Enter new password to reset your password",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Form(
                            key: _formKey,

                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 30,
                                ),
                                child: Column(
                                  children: [
                                    //password field
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
                                    const SizedBox(height: 30),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomEBtn(
                                            text: Text(
                                              "Submit",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            height: 60,
                                            width: double.infinity,
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                cubit.updatePassword(
                                                  _passwordcontroller.text,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
    _passwordcontroller.dispose();
    _confirmPasswordcontroller.dispose();
    super.dispose();
  }
}
