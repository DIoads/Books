import 'package:book/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntityEntity> getUserInfo(String uid);

  createUser({required UserEntityEntity user, required String uid});
}
