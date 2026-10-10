import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/models/product_model/comment.dart';
import 'package:e_commerce_app/models/product_model/product.dart';
import 'package:e_commerce_app/views/product_details/logic/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentListWidget extends StatelessWidget {
  CommentListWidget({super.key, required this.product});
  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client
          .from('comments')
          .stream(primaryKey: ["comm_id"])
          .eq("for_product", product.productId!)
          .order("created_at"),
      builder: (_, asyncSnapshot) {
        List<Map<String, dynamic>>? data = asyncSnapshot.data;
        //loading
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.kPrimaryColor,
            ),
          );
        }
        //there is data
        else if (asyncSnapshot.hasData) {
          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              height: 32,
              child: Divider(color: Colors.black, height: 1),
            ),
            itemBuilder: (context, index) => Column(
              children: [
                UserCommentWidget(comment: CommentModel.fromJson(data![index])),
              ],
            ),
            itemCount: data?.length ?? 0,
          );
        }
        //there is no data
        else if (!asyncSnapshot.hasData) {
          return Center(child: Text("No comments"));
        } else {
          return Center(child: Text("something went wrong"));
        }
      },
    );
  }
}

class UserCommentWidget extends StatelessWidget {
  UserCommentWidget({super.key, required this.comment});
  CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.userName ?? "user name",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            comment.comment ?? "...",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,

            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          Text(
            comment.replay ?? "reply...",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
