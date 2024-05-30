import 'package:book/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUserInfo(String uid);

  createUpdateUser({required UserEntity user, required String uid});
}
