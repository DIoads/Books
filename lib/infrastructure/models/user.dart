import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String userId;
  String eMail;
  String name;

  UserModel({
    required this.userId,
    required this.eMail,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        eMail: json["eMail"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "eMail": eMail,
        "name": name,
      };
}
