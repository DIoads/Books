class MyUser {
  String? age;
  String? email;
  List<String>? favGenres;
  String? imageUrl;
  String? username;
  String? userId;

  MyUser({
    this.age,
    this.email,
    this.favGenres,
    this.imageUrl,
    this.username,
    this.userId,
  });

  String? get getAge => age;
  String? get getEmail => email;
  List<String>? get getFavGenres => favGenres;
  String? get gerImageUrl => imageUrl;
  String? get getUsername => username;
  String? get getUserId => userId;

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

  set setUserId(String userId) {
    this.userId = userId;
  }
}
