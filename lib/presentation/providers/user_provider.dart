import 'package:book/domain/auth/auth_services_interface.dart';
import 'package:book/domain/entities/user_entity.dart';
import 'package:book/infrastructure/auth/firebase_auth_services.dart';
import 'package:book/infrastructure/repositories/user_repository_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final userNotifierProvider = StateNotifierProvider<UserNotifier, MyUser>(
  (ref) => UserNotifier(),
);

class UserNotifier extends StateNotifier<MyUser> {
  late final MyUser currentUser;
  final AuthServicesInterface _auth = FirebaseAuthService();
  final _userRepo = UserRepositoryImpl();

  UserNotifier() : super(MyUser(age: '', username: ''));

  Future<void> logIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    User? user = await _auth.logInWithEmailAndPassword(email, password);

    if (user != null) {
      state = MyUser(
        age: '',
        username: '',
      );

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
      state = MyUser(age: age, username: username);
      await _userRepo.createUser(user: state, uid: user.uid);

      if (context.mounted) context.go('/home');
    }
  }

  Future<void> logOut(BuildContext context) async {
    _auth.signOut();
    state = MyUser(age: '', username: '');
    context.go('/login');
  }
}
