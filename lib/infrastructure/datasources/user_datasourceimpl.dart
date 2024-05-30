import 'package:book/domain/datasources/user_datasource.dart';
import 'package:book/domain/entities/user_entity.dart';
import 'package:book/infrastructure/mappers/user_mapper.dart';
import 'package:book/infrastructure/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatasourceimpl extends UserDatasource {
  final _db = FirebaseFirestore.instance;

  @override
  createUpdateUser({required UserEntity user, required String uid}) async {
    await _db
        .collection("users")
        .doc(uid)
        .set(UserMapper.castToModel(user).toJson());
  }

  @override
  Future<UserEntity> getUserInfo(String uid) async {
    final ref = _db.collection("users").doc(uid).withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, _) => user.toJson(),
        );

    final docSnap = await ref.get();
    final user = docSnap.data();
    return UserMapper.castToEntity(user!);
  }
}
