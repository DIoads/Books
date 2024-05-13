import 'package:book/infrastructure/models/user.dart';

class MyUser {
  String age;
  String email;
  List<String>? favGenres;
  String? imageUrl;
  String username;

  MyUser({
    required this.age,
    required this.email,
    this.favGenres,
    this.imageUrl,
    required this.username,
  });

  String? get getAge => age;
  String? get getEmail => email;
  List<String>? get getFavGenres => favGenres;
  String? get gerImageUrl => imageUrl;
  String? get getUsername => username;

  set setAge(String age) {
    this.age = age;
  }

  set setEMail(String email) {
    this.email = email;
  }

  set setFavGenres(List<String> favGenres) {
    this.favGenres = favGenres;
  }

  set setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  }

  set setUsername(String username) {
    this.username = username;
  }

  UserModel toUserModel() => UserModel(
      age: age, email: email, favGenres: [], imageUrl: "", username: username);
}
