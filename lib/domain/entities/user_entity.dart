import 'package:book/infrastructure/models/user_model.dart';

class UserEntity {
  String age;
  List<String>? favGenres;
  String? imageUrl;
  String username;

  UserEntity({
    required this.age,
    this.favGenres,
    this.imageUrl,
    required this.username,
  });

  String? get getAge => age;
  List<String>? get getFavGenres => favGenres;
  String? get gerImageUrl => imageUrl;
  String? get getUsername => username;

  set setAge(String age) {
    this.age = age;
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

  UserModel toUserModel() =>
      UserModel(age: age, favGenres: [], imageUrl: "", username: username);
}
