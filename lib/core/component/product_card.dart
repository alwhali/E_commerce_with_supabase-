import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/custom_cached_image.dart';
import 'package:e_commerce_app/core/functions/navigate/class_my_navigate.dart';
import 'package:e_commerce_app/models/product_model/product.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/views/product_details/ui/product_detailsScreen.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_ebtn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});
  final ProductModel product;

  double discountOfProduct(double price, double discount) {
    double discontOfPro = price * (discount / 100);
    return discontOfPro;
  }

  double priceAfterDiscount(double price, double discount) {
    return price - discountOfProduct(price, discount);
  }

  List<String> ForUserList(ProductModel product) {
    List<String> forUserList = [];
    for (var element in product.favoriteProducts!) {
      forUserList.add(element.forUser!);
    }
    return forUserList;
  }

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.read<AuthCubit>();
    bool isFavorite = ForUserList(product).contains(cubit.userModel!.userId!);

    return GestureDetector(
      onTap: () {
        MyNavigate.navigateTo(context, ProductDetails(product: product));
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
                    url: product.imageUrl!,
                    height: 180,
                    width: double.infinity,
                  ),
                ),
                // discount container
                double.parse(product.discount!) == 0
                    ? Container()
                    : Positioned(
                        child: Container(
                          height: 40,
                          width: 80,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "${product.discount!.split('.')[0]}% OFF",
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
                        product.name!,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : AppColors.kGrayColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  // price of product and buy button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      double.parse(product.discount!) == 0
                          ? Text(
                              "${product.price} LE",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            )
                          :
                            //price now and before
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${priceAfterDiscount(double.parse(product.price!), double.parse(product.discount!)).toString()} LE",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "${product.price} LE",
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
