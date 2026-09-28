import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/product_card.dart';
import 'package:e_commerce_app/core/cubits/cubit/home_cubit.dart';
import 'package:e_commerce_app/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProductsWidget extends StatelessWidget {
  ListProductsWidget({super.key, this.physics, this.shrinkWrap});
  ScrollPhysics? physics;
  bool? shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetDataError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          final products = context.read<HomeCubit>().products;
          return state is GetDataLoading
              ? Container(
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
