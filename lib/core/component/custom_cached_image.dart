import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  CustomCachedNetworkImage({
    super.key,
    required this.url,
    required this.height,
    required this.width,
  });

  final String url;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl:
          // "https://i.pinimg.com/1200x/3d/60/cb/3d60cbaf1a8349ed22d1c6a74ca22971.jpg",
          url,
      fit: BoxFit.fitWidth,
      placeholder: (context, url) => SizedBox(
        height: 180,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.kPrimaryColor),
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: 180,
        width: double.infinity,
        child: Center(child: Icon(Icons.error, color: Colors.red, size: 38)),
      ),
    );
  }
}
