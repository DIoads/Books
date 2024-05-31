import 'package:book/domain/auth/auth_services_interface.dart';
import 'package:book/domain/entities/user_entity.dart';
import 'package:book/infrastructure/auth/firebase_auth_services.dart';
import 'package:book/infrastructure/repositories/user_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_storage/firebase_storage.dart';

final userNotifierProvider = StateNotifierProvider<UserNotifier, UserEntity>(
  (ref) => UserNotifier(),
);

class UserNotifier extends StateNotifier<UserEntity> {
  final AuthServicesInterface _auth = FirebaseAuthService();
  final _userRepo = UserRepositoryImpl();
  final FirebaseStorage storage = FirebaseStorage.instance;
  UserNotifier() : super(UserEntity(age: '', username: ''));

  Future<void> logIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    User? user = await _auth.logInWithEmailAndPassword(email, password);

    if (user != null) {
      state = await _userRepo.getUserInfo(user.uid);

      if (context.mounted) context.go('/home');
    }
  }

  Future<void> signUp(
      {required BuildContext context,
      required String email,
      required String password,
      required String age,
      required String username}) async {
    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      state = UserEntity(age: age, username: username);
      await _userRepo.createUpdateUser(user: state, uid: user.uid);

      if (context.mounted) context.go('/home');
    }
  }

  Future<void> logOut(BuildContext context) async {
    _auth.signOut();
    state = UserEntity(age: '', username: '');
    context.go('/login');
  }

  Future<void> update(
      {required BuildContext context,
      required String username,
      required String age}) async {
    UserEntity newData = UserEntity(age: age, username: username);

    User? user = _auth.getCurrentUser();

    await _userRepo.createUpdateUser(user: newData, uid: user!.uid);
    state = newData;
    if (context.mounted) context.pop();
  }

  Future<void> delete() async {
    User? user = _auth.getCurrentUser();

    await _userRepo.deleteUser(uid: user!.uid);
    await _auth.deleteUser();
    state = UserEntity(age: '', username: '');
  }
}
