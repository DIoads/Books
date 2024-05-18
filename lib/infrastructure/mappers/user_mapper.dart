import 'package:book/domain/entities/user_entity.dart';
import 'package:book/infrastructure/models/user_model.dart';

class UserMapper {
  static UserEntity castToEntity(UserModel user) => UserEntity(
      age: user.age, username: user.username, imageURL: user.imageURL);

  static UserModel castToModel(UserEntity user) =>
      UserModel(age: user.age, username: user.username);
}
