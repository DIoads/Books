import 'package:book/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<MyUser> getUserInfo(String uid);

  createUser({required MyUser user, required String uid});
}
