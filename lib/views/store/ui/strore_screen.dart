import 'package:e_commerce_app/core/component/custom_search_field.dart';
import 'package:e_commerce_app/core/component/list_products.dart';
import 'package:e_commerce_app/core/component/product_card.dart';
import 'package:e_commerce_app/core/functions/navigate/class_my_navigate.dart';
import 'package:e_commerce_app/models/product_model/product.dart';
import 'package:e_commerce_app/views/home/ui/search_screen.dart';
import 'package:flutter/material.dart';

class StroreScreen extends StatefulWidget {
  const StroreScreen({super.key});

  @override
  State<StroreScreen> createState() => _StroreScreenState();
}

class _StroreScreenState extends State<StroreScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,

      // physics: NeverScrollableScrollPhysics(),
      children: [
        Text(
          textAlign: TextAlign.center,
          "Welcome To Our Market",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Divider(thickness: 1, color: Colors.grey),
        SizedBox(height: 20),
        CustomSearchField(
          onpressed: () {
            if (_searchController.text.isNotEmpty) {
              MyNavigate.navigateTo(
                context,
                SearchScreen(query: _searchController.text),
              );
              _searchController.clear();
            }
          },
          searchController: _searchController,
        ),
        SizedBox(height: 20),
        ListProductsWidget(),
      ],
    );
  }
}
