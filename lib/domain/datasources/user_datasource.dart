import 'package:book/domain/entities/user_entity.dart';

abstract class UserDatasource {
  Future<UserEntity> getUserInfo(String uid);

  createUpdateUser({required UserEntity user, required String uid});
  Future<void> deleteUser({required String uid});
}
