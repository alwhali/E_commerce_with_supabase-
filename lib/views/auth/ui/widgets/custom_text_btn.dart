import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextBtn extends StatelessWidget {
  CustomTextBtn({super.key, required this.text, required this.onTap});
  String text;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.kPrimaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
