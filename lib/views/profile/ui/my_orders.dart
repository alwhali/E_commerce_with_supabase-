import 'package:e_commerce_app/core/component/custom_app_bar.dart';
import 'package:e_commerce_app/core/component/product_card.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile"),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 10),
        child: ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductCard(
                url:
                    "https://i.pinimg.com/1200x/a8/fd/81/a8fd8133765aef2c20f468d68c117617.jpg",
                name: 'Hand ps',
                price: 225,
                discount: 10,
                rating: 5,
                isFavorite: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
