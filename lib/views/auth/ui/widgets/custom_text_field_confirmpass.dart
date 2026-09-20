import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFieldConfirmPass extends StatelessWidget {
  CustomTextFieldConfirmPass({
    super.key,
    required this.keyboardType,
    required this.lableText,
    this.suffixIcon,
    this.isObscure = false,
    this.controller,
    required this.password,
    this.onChanged,
  });
  bool isObscure;
  String lableText = " ";
  TextInputType keyboardType;
  Widget? suffixIcon;
  TextEditingController? controller;
  String password;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$lableText is required";
        } else if (password != value) {
          return "Passwords do not match";
        }

        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: lableText,
        suffixIcon: suffixIcon,

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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red),
        ),

        // suffixIcon: IconButton(
        //   icon: suffixIcon ?? const Icon(Icons.remove_red_eye),
        //   onPressed: () {},
        // ),
      ),
    );
  }
}
