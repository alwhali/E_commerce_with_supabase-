import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/custom_app_bar.dart';
import 'package:e_commerce_app/core/component/custom_cached_image.dart';
import 'package:e_commerce_app/models/product_model/product.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_field.dart';
import 'package:e_commerce_app/views/product_details/logic/cubit/product_details_cubit.dart';
import 'package:e_commerce_app/views/product_details/logic/models/rate_model.dart';
import 'package:e_commerce_app/views/product_details/ui/widdget/comment-_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.product});
  ProductModel product;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  SupabaseClient client = Supabase.instance.client;

  double calculateTotalRate(List<RateModel> rates) {
    double totalRate = 0;
    for (var rate in rates) {
      totalRate += rate.rate!;
    }
    totalRate = totalRate / rates.length;
    return totalRate;
  }

  int getUserRate(List<RateModel> rates) {
    int userRate = 0;
    for (var rate in rates) {
      if (rate.forUser == client.auth.currentUser!.id) {
        userRate = rate.rate!;
      }
    }
    return userRate;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailsCubit()
            ..getAllRatesForProd(productId: widget.product.productId!),
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = context.read<ProductDetailsCubit>();
          final totalRate = calculateTotalRate(cubit.rates);
          final userRate = getUserRate(cubit.rates);

          return Scaffold(
            appBar: CustomAppBar(title: widget.product.name!),
            body: state is GetAllRatesProdLoading
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.kPrimaryColor,
                    ),
                  )
                : ListView(
                    children: [
                      CustomCachedNetworkImage(
                        url: widget.product.imageUrl!,
                        height: 200,
                        width: double.infinity,
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            // price and total rating and favorite button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${widget.product.price} LE",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  // mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.star, color: Colors.amber),
                                    SizedBox(width: 4),
                                    Text(
                                      totalRate.toStringAsFixed(1),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: false ? Colors.red : Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(height: 32),
                            // product discription
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "product discription",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 32),

                            // user rate
                            RatingBar.builder(
                              initialRating: userRate == 0
                                  ? 0
                                  : userRate.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              // allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              itemBuilder: (context, _) =>
                                  Icon(Icons.star, color: Colors.amber),
                              onRatingUpdate: (rating) {
                                print("Rating: $rating");
                              },
                            ),
                            SizedBox(height: 40),
                            CustomTextField(
                              keyboardType: TextInputType.text,
                              lableText: "type your Feedback",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.send),
                              ),
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Comments",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            CommentListWidget(),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
