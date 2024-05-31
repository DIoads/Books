import 'package:book/domain/datasources/user_datasource.dart';
import 'package:book/domain/entities/user_entity.dart';
import 'package:book/domain/repositories/user_repository.dart';
import 'package:book/infrastructure/datasources/user_datasource_impl.dart';

class UserRepositoryImpl implements UserRepository {
  UserDatasource userDataSource = UserDatasourceimpl();
  @override
  createUpdateUser({required UserEntity user, required String uid}) async {
    userDataSource.createUpdateUser(user: user, uid: uid);
  }

  @override
  Future<UserEntity> getUserInfo(String uid) async {
    return await userDataSource.getUserInfo(uid);
  }

  @override
  Future<void> deleteUser({required String uid}) async {
    //usar runTransactions() si no .delete deja archivos en firebase
    await userDataSource.deleteUser(uid: uid);
  }
}
