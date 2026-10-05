class RateModel {
  String? rateId;
  DateTime? createdAt;
  String? forUser;
  String? forProduct;
  int? rate;

  RateModel({
    this.rateId,
    this.createdAt,
    this.forUser,
    this.forProduct,
    this.rate,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
    rateId: json['rate_id'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    forUser: json['for_user'] as String?,
    forProduct: json['for_product'] as String?,
    rate: json['rate'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'rate_id': rateId,
    'created_at': createdAt?.toIso8601String(),
    'for_user': forUser,
    'for_product': forProduct,
    'rate': rate,
  };
}
