import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomEBtn extends StatelessWidget {
  CustomEBtn({
    super.key,
    required this.text,
    required this.onTap,
    required this.width,
    required this.height,
  });
  String text;
  double width;
  double height;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        // maximumSize: Size(double.infinity, 60),
        // minimumSize: Size(40, 50),
        foregroundColor: AppColors.kWhiteColor,
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
