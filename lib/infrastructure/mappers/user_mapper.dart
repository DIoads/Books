import 'package:book/domain/entities/user_entity.dart';
import 'package:book/infrastructure/models/user_model.dart';

class UserMapper {
  static UserEntityEntity castToEntity(UserModel user) => UserEntityEntity(
      age: user.age, username: user.username, imageURL: user.imageURL);

  static UserModel castToModel(UserEntityEntity user) =>
      UserModel(age: user.age, username: user.username);
}
