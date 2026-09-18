import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/custom_app_bar.dart';
import 'package:e_commerce_app/core/component/custom_cached_image.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({
    super.key,
    required this.url,
    required this.name,
    required this.price,
    required this.isFavorite,
  });
  String url;
  String name;
  double price;
  bool isFavorite;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.name),
      body: ListView(
        children: [
          CustomCachedNetworkImage(
            url: widget.url,
            height: 200,
            width: double.infinity,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                // price and rating and favorite button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.price.toStringAsFixed(0)} LE",
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
                          "4.8",
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
                      color: widget.isFavorite ? Colors.red : Colors.black,
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
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  // allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => UserCommentWidget(),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 5,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserCommentWidget extends StatelessWidget {
  const UserCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User Name",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "this product is good",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            Text(
              "Reply...",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Reply...",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
