import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password is required";
        }
        return null;
      },
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

        // suffixIcon: IconButton(
        //   icon: suffixIcon ?? const Icon(Icons.remove_red_eye),
        //   onPressed: () {},
        // ),
      ),
    );
  }
}
