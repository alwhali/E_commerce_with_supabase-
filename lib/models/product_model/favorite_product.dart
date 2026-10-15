import 'dart:convert';

class FavoriteProductModel {
  String? id;
  String? forUser;
  DateTime? createdAt;
  String? forProduct;
  bool? isFavorite;

  FavoriteProductModel({
    this.id,
    this.forUser,
    this.createdAt,
    this.forProduct,
    this.isFavorite,
  });

  factory FavoriteProductModel.fromMap(Map<String, dynamic> data) {
    return FavoriteProductModel(
      id: data['id'] as String?,
      forUser: data['for_user'] as String?,
      createdAt: data['created_at'] == null
          ? null
          : DateTime.parse(data['created_at'] as String),
      forProduct: data['for_product'] as String?,
      isFavorite: data['is_favorite'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'for_user': forUser,
    'created_at': createdAt?.toIso8601String(),
    'for_product': forProduct,
    'is_favorite': isFavorite,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FavoriteProductModel].
  factory FavoriteProductModel.fromJson(String data) {
    return FavoriteProductModel.fromMap(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [FavoriteProductModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
