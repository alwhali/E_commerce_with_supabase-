import 'package:e_commerce_app/core/component/custom_app_bar.dart';
import 'package:e_commerce_app/core/component/list_products.dart';
import 'package:e_commerce_app/views/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.query});
  final String query;
  final EnumSearchType type = EnumSearchType.category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: query),
      body: ListView(
        children: [ListProductsWidget(query: query, type: type)],
      ),
    );
  }
}
