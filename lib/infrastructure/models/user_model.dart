import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String age;
  String imageURL;
  String username;

  UserModel({
    required this.age,
    required this.imageURL,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        age: json["age"],
        imageURL: json["imageURL"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "imageURL": imageURL,
        "username": username,
      };

  factory UserModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return UserModel(
        age: data?['age'],
        imageURL: data?['imageURL'],
        username: data?['username']);
  }
}
