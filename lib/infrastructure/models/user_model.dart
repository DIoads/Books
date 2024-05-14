import 'dart:convert';

import 'package:book/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String age;
  List<String> favGenres;
  String imageUrl;
  String username;

  UserModel({
    required this.age,
    required this.favGenres,
    this.imageUrl = "",
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        age: json["age"],
        favGenres: List<String>.from(json["favGenres"].map((x) => x)),
        imageUrl: json["imageURL"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "favGenres": List<dynamic>.from(favGenres.map((x) => x)),
        "imageURL": imageUrl,
        "username": username,
      };

  UserEntity toMyUserEntity() => UserEntity(
      age: age, favGenres: favGenres, imageUrl: imageUrl, username: username);

  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return UserModel(
        age: data?['age'],
        favGenres: List<String>.from(data?["favGenres"].map((x) => x)),
        imageUrl: data?['imageURL'],
        username: data?['username']);
  }
}
