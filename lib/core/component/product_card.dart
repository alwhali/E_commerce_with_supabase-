import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_ebtn.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      child: Column(
        children: [
          //image of product and discount
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  height: 180,
                  width: double.infinity,
                  imageUrl:
                      // "https://i.pinimg.com/1200x/3d/60/cb/3d60cbaf1a8349ed22d1c6a74ca22971.jpg",
                      "https://i.pinimg.com/1200x/a8/fd/81/a8fd8133765aef2c20f468d68c117617.jpg",
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) => SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: Center(
                      child: Icon(Icons.error, color: Colors.red, size: 38),
                    ),
                  ),
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
                      "10% OFF",
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
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12),
            child: Column(
              children: [
                //name of product and favorite button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hand ps",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.favorite, color: Colors.grey),
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
                          "223 LE",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "290 LE",
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
    );
  }
}
