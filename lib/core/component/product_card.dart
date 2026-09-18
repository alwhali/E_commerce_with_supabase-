import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/custom_cached_image.dart';
import 'package:e_commerce_app/core/functions/navigate/class_my_navigate.dart';
import 'package:e_commerce_app/core/screens/product_details.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_ebtn.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.url,
    required this.name,
    required this.price,
    required this.discount,
    required this.rating,
    required this.isFavorite,
  });
  String url;
  String name;
  double price;
  double discount;
  int rating;
  bool isFavorite;

  double discountOfProduct() {
    double discontOfPro = price * (discount / 100);
    return discontOfPro;
  }

  double priceAfterDiscount() {
    return price - discountOfProduct();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyNavigate.navigateTo(
          context,
          ProductDetails(url: url, name: name, price: price, isFavorite: true),
        );
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        child: Column(
          children: [
            //image of product and discount
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomCachedNetworkImage(
                    url: url,
                    height: 180,
                    width: double.infinity,
                  ),
                ),
                // discount container
                Positioned(
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "${discount.toStringAsFixed(0)}% OFF",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // detials product
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 12,
              ),
              child: Column(
                children: [
                  //name of product and favorite button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          isFavorite = !isFavorite;
                        },
                        child: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  // price of product and buy button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price now and before
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${priceAfterDiscount().toString()} LE",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "${price.toString()} LE",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 16,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                      // buy button
                      CustomEBtn(
                        text: Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {},
                        width: 114,
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
