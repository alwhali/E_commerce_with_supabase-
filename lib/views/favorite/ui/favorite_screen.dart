import 'package:e_commerce_app/core/component/custom_search_field.dart';
import 'package:e_commerce_app/core/component/product_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,

      // physics: NeverScrollableScrollPhysics(),
      children: [
        Text(
          textAlign: TextAlign.center,
          "Your Favorites",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Divider(thickness: 1, color: Colors.grey),

        SizedBox(height: 20),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return ProductCard();
          },
        ),
      ],
    );
  }
}
