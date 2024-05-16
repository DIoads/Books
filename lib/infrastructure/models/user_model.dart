import 'dart:convert';

import 'package:book/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String age;
  List<String> favGenres;
  String imageURL;
  String username;

  UserModel({
    required this.age,
    required this.favGenres,
    this.imageURL = "",
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        age: json["age"],
        favGenres: List<String>.from(json["favGenres"].map((x) => x)),
        imageURL: json["imageURL"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "favGenres": List<dynamic>.from(favGenres.map((x) => x)),
        "imageURL": imageURL,
        "username": username,
      };

  UserEntity toMyUserEntity() => UserEntity(
      age: age, favGenres: favGenres, imageURL: imageURL, username: username);

  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return UserModel(
        age: data?['age'],
        favGenres: List<String>.from(data?["favGenres"].map((x) => x)),
        imageURL: data?['imageURL'],
        username: data?['username']);
  }
}
