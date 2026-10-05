import 'dart:convert';

class Purchase {
	String? purId;
	String? forUser;
	bool? isBought;
	DateTime? createdAt;
	String? forProduct;

	Purchase({
		this.purId, 
		this.forUser, 
		this.isBought, 
		this.createdAt, 
		this.forProduct, 
	});

	factory Purchase.fromMap(Map<String, dynamic> data) => Purchase(
				purId: data['pur_id'] as String?,
				forUser: data['for_user'] as String?,
				isBought: data['is_bought'] as bool?,
				createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
				forProduct: data['for_product'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'pur_id': purId,
				'for_user': forUser,
				'is_bought': isBought,
				'created_at': createdAt?.toIso8601String(),
				'for_product': forProduct,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Purchase].
	factory Purchase.fromJson(String data) {
		return Purchase.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Purchase] to a JSON string.
	String toJson() => json.encode(toMap());
}
