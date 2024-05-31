class UserEntity {
  String age;
  String imageURL;
  String username;

  UserEntity({
    required this.age,
    required this.imageURL,
    required this.username,
  });

  String get getAge => age;
  String get getImageUrl => imageURL;
  String get getUsername => username;

  set setAge(String age) {
    this.age = age;
  }

  set setImageURL(String imageURL) {
    this.imageURL = imageURL;
  }

  set setUsername(String username) {
    this.username = username;
  }
}
