import 'package:e_commerce_app/core/component/custom_app_bar.dart';
import 'package:e_commerce_app/core/component/product_card.dart';
import 'package:e_commerce_app/core/functions/navigate/class_my_navigate.dart';
import 'package:e_commerce_app/models/product_model/product.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:e_commerce_app/views/auth/ui/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    if (!cubit.isAuthenticated) {
      return MyNavigate.navigatePushReplacement(context, LoginScreen())
          as Widget;
    }
    return Scaffold(
      appBar: CustomAppBar(title: "My Order"),
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
                product: ProductModel(
                  productId: "1",
                  createdAt: DateTime.now(),
                  name: "product name",
                  price: "100",
                  discount: "10",
                  description: "product discription",
                  category: "category",
                  imageUrl:
                      "https://i.pinimg.com/1200x/3d/60/cb/3d60cbaf1a8349ed22d1c6a74ca22971.jpg",
                  favoriteProducts: [],
                  purchases: [],
                  comments: [],
                ),
                isFavorite: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
