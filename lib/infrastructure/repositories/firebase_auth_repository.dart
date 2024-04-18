import 'package:book/domain/repositories/user_repository.dart';
import 'package:book/infrastructure/models/user.dart';

class FirebaseUserRepository extends UserRepository {
  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> setUserData(MyUser user) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<MyUser?> signUp(MyUser myUser, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
