import 'package:book/domain/auth/auth_services_interface.dart';
import 'package:book/domain/entities/user_entity.dart';
import 'package:book/infrastructure/auth/firebase_auth_services.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  Future<void> onSignUp(BuildContext context, String age, String email,
      String username, String password) async {
    final FirebaseAuthService auth = FirebaseAuthService();

    User? authUser = await auth.signUpWithEmailAndPassword(email, password);
    if (authUser != null) {
      MyUser currentUser = MyUser(age: age, email: email, userId: authUser.uid);
      _currentUserChanged(currentUser, auth);

      if (context.mounted) context.go('/home');
    }
  }

  Future<void> onLogIn(BuildContext context, email, String password) async {
    final FirebaseAuthService auth = FirebaseAuthService();
    User? authUser = await auth.logInWithEmailAndPassword(email, password);

    if (authUser != null) {
      MyUser currentUser = MyUser(email: email, userId: authUser.uid);
      _currentUserChanged(currentUser, auth);
      if (context.mounted) context.go('/home');
    }
  }

  _currentUserChanged(MyUser myUser, FirebaseAuthService auth) {
    emit(state.copyWith(currentUser: myUser, auth: auth));
  }

  Future<void> onLogOut(BuildContext context) async {
    final FirebaseAuthService auth = FirebaseAuthService();
    auth.signOut();
    emit(state.copyWith(currentUser: MyUser(), auth: auth));
    context.go('/login');
  }
}
