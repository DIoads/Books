import 'dart:convert';

MyUser userFromJson(String str) => MyUser.fromJson(json.decode(str));

String userToJson(MyUser data) => json.encode(data.toJson());

class MyUser {
  String userId;
  String eMail;
  String name;

  MyUser({
    required this.userId,
    required this.eMail,
    required this.name,
  });

  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
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
