import 'package:book/domain/entities/user_entity.dart';

abstract class UserDatasource {
  Future<UserEntity> getUserInfo(String uid);

  createUser({required UserEntity user, required String uid});
}
