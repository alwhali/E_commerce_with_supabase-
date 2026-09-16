import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {},
              decoration: InputDecoration(
                hintText: "Search in Market...",
                border: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(10),
                  // borderSide: BorderSide(color: AppColors.kBordersideColor),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            width: 60,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.kPrimaryColor,
            ),
            child: Center(
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
