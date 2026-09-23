import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.keyboardType,
    required this.lableText,
    this.suffixIcon,
    this.isObscure = false,
    this.controller,
    this.onChanged,
  });
  bool isObscure;
  String lableText = " ";
  TextInputType keyboardType;
  Widget? suffixIcon;
  TextEditingController? controller;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$lableText is required";
        }
        return null;
      },
      controller: controller,
      onChanged: onChanged,
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
