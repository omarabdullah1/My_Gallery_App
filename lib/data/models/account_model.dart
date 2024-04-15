class AccountModelUser {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  AccountModelUser({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  AccountModelUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    email = json['email']?.toString();
    emailVerifiedAt = json['email_verified_at']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class AccountModel {
  AccountModelUser? user;
  String? token;

  AccountModel({
    this.user,
    this.token,
  });

  AccountModel.fromJson(Map<String, dynamic> json) {
    user =
        (json['user'] != null) ? AccountModelUser.fromJson(json['user']) : null;
    token = json['token']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}
