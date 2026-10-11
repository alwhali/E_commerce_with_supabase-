import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/product_card.dart';
import 'package:e_commerce_app/views/home/logic/cubit/home_cubit.dart';
import 'package:e_commerce_app/models/product_model/product.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProductsWidget extends StatelessWidget {
  ListProductsWidget({
    super.key,
    this.physics,
    this.shrinkWrap,
    this.query,
    this.type,
  });
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final String? query;
  final EnumSearchType? type;

  List<String> ForUserList(ProductModel product) {
    List<String> forUserList = [];
    for (var element in product.favoriteProducts!) {
      forUserList.add(element.forUser!);
    }
    return forUserList;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(query: query, type: type),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is GetProductsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          final products = query == null
              ? context.read<HomeCubit>().products
              : context.read<HomeCubit>().foundProducts;
          return state is GetProductsLoading
              ? SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.kPrimaryColor,
                    ),
                  ),
                )
              : ListView.builder(
                  physics: physics ?? NeverScrollableScrollPhysics(),
                  shrinkWrap: shrinkWrap ?? true,
                  itemCount: products.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(product: products[index]);
                  },
                );
        },
      ),
    );
  }
}
