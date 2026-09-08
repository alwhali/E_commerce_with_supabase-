import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAwayToLogin extends StatelessWidget {
  CustomAwayToLogin({
    super.key,
    required this.awayToLoginText,
    required this.onPressed,
  });
  String awayToLoginText;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          awayToLoginText,
          style: TextStyle(
            color: AppColors.kBlackColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(70, 50),
            // minimumSize: Size(40, 50),
            foregroundColor: AppColors.kWhiteColor,
            backgroundColor: AppColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: Icon(Icons.arrow_forward, color: Colors.white, size: 26),
        ),
      ],
    );
  }
}
