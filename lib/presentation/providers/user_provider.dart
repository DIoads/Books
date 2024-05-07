import 'package:book/domain/auth/auth_services_interface.dart';
import 'package:book/domain/entities/user_entity.dart';
import 'package:book/infrastructure/auth/firebase_auth_services.dart';
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

  UserNotifier() : super(MyUser());

  Future<void> logIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    User? user = await _auth.logInWithEmailAndPassword(email, password);

    if (user != null) {
      state = MyUser(userId: user.uid, email: user.email);

      if (context.mounted) context.go('/home');
    }
  }

  Future<void> signUp(
      BuildContext context, String email, String password) async {
    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      state = MyUser(userId: user.uid, email: user.email);

      if (context.mounted) context.go('/home');
    }
  }

  Future<void> logOut(BuildContext context) async {
    _auth.signOut();
    state = MyUser();
    context.go('/login');
  }
}
