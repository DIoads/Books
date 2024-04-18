class MyUser {
  String? userId;
  String? eMail;
  String? name;

  MyUser({this.userId, this.name, this.eMail});

  String? get getUserId => userId;
  String? get getEMail => eMail;
  String? get getName => name;

  set setUserId(String userId) {
    this.userId = userId;
  }

  set setEMail(String eMail) {
    this.eMail = eMail;
  }

  set setName(String name) {
    this.name = name;
  }
}
