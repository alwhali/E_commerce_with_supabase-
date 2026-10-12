import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/functions/navigate/class_my_navigate.dart';
import 'package:e_commerce_app/views/home/logic/cubit/home_cubit.dart';
import 'package:e_commerce_app/views/home/ui/category_screen.dart';
import 'package:e_commerce_app/views/home/ui/search_screen.dart';
import 'package:flutter/material.dart';

class CustomElementCategory extends StatelessWidget {
  CustomElementCategory({super.key, required this.icon, required this.title});
  IconData icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            MyNavigate.navigateTo(context, CategoryScreen(query: title));
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.kPrimaryColor,
            ),
            child: Icon(icon, color: Colors.white, size: 35),
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
