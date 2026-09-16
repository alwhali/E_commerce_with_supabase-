import 'package:e_commerce_app/core/component/custom_search_field.dart';
import 'package:e_commerce_app/core/component/product_card.dart';
import 'package:flutter/material.dart';

class StroreScreen extends StatefulWidget {
  const StroreScreen({super.key});

  @override
  State<StroreScreen> createState() => _StroreScreenState();
}

class _StroreScreenState extends State<StroreScreen> {
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
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductCard(),
            );
          },
        ),
      ],
    );
  }
}
