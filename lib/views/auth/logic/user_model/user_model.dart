class UserModel {
  String? userId;
  String? name;
  String? email;

  UserModel({this.userId, this.name, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
