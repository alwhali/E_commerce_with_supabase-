import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/custom_search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        CustomSearchField(),
        SizedBox(height: 20),
        // Image.asset("assets/images/buy.jpg", fit: BoxFit.fill),
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("assets/images/buy.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),

        SizedBox(height: 20),
        Text(
          "Popular Categories",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 100,

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CustomElementCategory(icon: Icons.sports, title: "Sports"),
              SizedBox(width: 12),
              CustomElementCategory(
                icon: Icons.laptop_chromebook_sharp,
                title: "Electronics",
              ),
              SizedBox(width: 12),
              CustomElementCategory(
                icon: Icons.collections_outlined,
                title: "Collections",
              ),
              SizedBox(width: 12),
              CustomElementCategory(
                icon: Icons.menu_book_sharp,
                title: "Books",
              ),
              SizedBox(width: 12),
              CustomElementCategory(icon: Icons.gamepad, title: "Games"),
              SizedBox(width: 12),
              CustomElementCategory(
                icon: Icons.auto_stories_sharp,
                title: "Auto",
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Recent Products",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class CustomElementCategory extends StatelessWidget {
  CustomElementCategory({super.key, required this.icon, required this.title});
  IconData icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.kPrimaryColor,
          ),
          child: Icon(icon, color: Colors.white, size: 35),
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
