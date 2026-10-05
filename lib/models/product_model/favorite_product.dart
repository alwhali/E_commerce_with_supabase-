import 'dart:convert';

class FavoriteProduct {
	String? id;
	String? forUser;
	DateTime? createdAt;
	String? forProduct;
	bool? isFavorite;

	FavoriteProduct({
		this.id, 
		this.forUser, 
		this.createdAt, 
		this.forProduct, 
		this.isFavorite, 
	});

	factory FavoriteProduct.fromMap(Map<String, dynamic> data) {
		return FavoriteProduct(
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
  /// Parses the string and returns the resulting Json object as [FavoriteProduct].
	factory FavoriteProduct.fromJson(String data) {
		return FavoriteProduct.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [FavoriteProduct] to a JSON string.
	String toJson() => json.encode(toMap());
}
