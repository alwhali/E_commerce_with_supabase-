import 'dart:convert';

class Comment {
	String? commId;
	String? comment;
	String? forUser;
	DateTime? createdAt;
	String? forProduct;

	Comment({
		this.commId, 
		this.comment, 
		this.forUser, 
		this.createdAt, 
		this.forProduct, 
	});

	factory Comment.fromMap(Map<String, dynamic> data) => Comment(
				commId: data['comm_id'] as String?,
				comment: data['comment'] as String?,
				forUser: data['for_user'] as String?,
				createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
				forProduct: data['for_product'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'comm_id': commId,
				'comment': comment,
				'for_user': forUser,
				'created_at': createdAt?.toIso8601String(),
				'for_product': forProduct,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Comment].
	factory Comment.fromJson(String data) {
		return Comment.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Comment] to a JSON string.
	String toJson() => json.encode(toMap());
}
