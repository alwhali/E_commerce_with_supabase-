import 'dart:convert';

import 'comment.dart';
import 'favorite_product.dart';
import 'purchase.dart';

class ProductModel {
  String? productId;
  DateTime? createdAt;
  String? name;
  String? price;
  String? discount;
  String? description;
  String? category;
  String? imageUrl;
  List<FavoriteProduct>? favoriteProducts;
  List<Purchase>? purchases;
  List<Comment>? comments;

  ProductModel({
    this.productId,
    this.createdAt,
    this.name,
    this.price,
    this.discount,
    this.description,
    this.category,
    this.imageUrl,
    this.favoriteProducts,
    this.purchases,
    this.comments,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data) => ProductModel(
    productId: data['product_id'] as String?,
    createdAt: data['created_at'] == null
        ? null
        : DateTime.parse(data['created_at'] as String),
    name: data['name'] as String?,
    price: data['price'] as String?,
    discount: data['discount'] as String?,
    description: data['description'] as String?,
    category: data['category'] as String?,
    imageUrl: data['image_url'] as String?,
    favoriteProducts: (data['favorite_products'] as List<dynamic>?)
        ?.map((e) => FavoriteProduct.fromMap(e as Map<String, dynamic>))
        .toList(),
    purchases: (data['purchases'] as List<dynamic>?)
        ?.map((e) => Purchase.fromMap(e as Map<String, dynamic>))
        .toList(),
    comments: (data['comments'] as List<dynamic>?)
        ?.map((e) => Comment.fromMap(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toMap() => {
    'product_id': productId,
    'created_at': createdAt?.toIso8601String(),
    'name': name,
    'price': price,
    'discount': discount,
    'description': description,
    'category': category,
    'image_url': imageUrl,
    'favorite_products': favoriteProducts?.map((e) => e.toMap()).toList(),
    'purchases': purchases?.map((e) => e.toMap()).toList(),
    'comments': comments?.map((e) => e.toMap()).toList(),
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductModel].
  factory ProductModel.fromJson(String data) {
    return ProductModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
