import 'package:book/infrastructure/models/user_model.dart';

class UserEntity {
  String age;
  List<String>? favGenres;
  String? imageURL;
  String username;

  UserEntity({
    required this.age,
    this.favGenres,
    this.imageURL,
    required this.username,
  });

  String? get getAge => age;
  List<String>? get getFavGenres => favGenres;
  String? get gerImageUrl => imageURL;
  String? get getUsername => username;

  set setAge(String age) {
    this.age = age;
  }

  set setFavGenres(List<String> favGenres) {
    this.favGenres = favGenres;
  }

  set setImageUrl(String imageUrl) {
    this.imageURL = imageUrl;
  }

  set setUsername(String username) {
    this.username = username;
  }

  UserModel toUserModel() =>
      UserModel(age: age, favGenres: [], imageURL: "", username: username);
}
