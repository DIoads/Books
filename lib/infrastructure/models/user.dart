import 'dart:convert';

import 'package:book/domain/entities/user_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String age;
  String email;
  List<String> favGenres;
  String imageUrl;
  String username;

  UserModel({
    required this.age,
    required this.email,
    required this.favGenres,
    required this.imageUrl,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        age: json["age"],
        email: json["email"],
        favGenres: List<String>.from(json["favGenres"].map((x) => x)),
        imageUrl: json["imageURL"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "favGenres": List<dynamic>.from(favGenres.map((x) => x)),
        "imageURL": imageUrl,
        "username": username,
      };

  MyUser toMyUserEntity() => MyUser(
      age: age,
      email: email,
      favGenres: favGenres,
      imageUrl: imageUrl,
      username: username);
}
