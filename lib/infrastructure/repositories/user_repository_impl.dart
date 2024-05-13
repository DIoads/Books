import 'package:book/domain/entities/user_entity.dart';
import 'package:book/domain/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositoryImpl extends UserRepository {
  final _db = FirebaseFirestore.instance;

  @override
  createUser({required MyUser user, required String uid}) async {
    await _db.collection("users").doc(uid).set(user.toUserModel().toJson());
  }

  @override
  Future<MyUser> getUserInfo(String uid) {
    throw UnimplementedError();
  }
}
