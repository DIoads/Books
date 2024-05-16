import 'package:book/domain/entities/user_entity.dart';
import 'package:book/domain/repositories/user_repository.dart';
import 'package:book/infrastructure/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositoryImpl implements UserRepository {
  final _db = FirebaseFirestore.instance;

  @override
  createUser({required UserEntity user, required String uid}) async {
    await _db.collection("users").doc(uid).set(user.toUserModel().toJson());
  }

  @override
  Future<UserEntity> getUserInfo(String uid) async {
    final ref = _db.collection("users").doc(uid).withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, _) => user.toJson(),
        );

    final docSnap = await ref.get();
    final user = docSnap.data();
    return user!.toMyUserEntity();
  }
}
