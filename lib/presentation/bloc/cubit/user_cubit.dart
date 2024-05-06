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
    final AuthServicesInterface auth = state.auth;

    User? authUser = await auth.signUpWithEmailAndPassword(email, password);
    if (authUser != null) {
      MyUser currentUser = MyUser(age: age, email: email, userId: authUser.uid);
      await _currentUserChanged(currentUser, auth);

      if (context.mounted) context.go('/home');
    }
  }

  Future<void> onLogIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    final AuthServicesInterface auth = state.auth;
    User? authUser = await auth.logInWithEmailAndPassword(email, password);

    if (authUser != null) {
      MyUser newUser = MyUser(email: email, userId: authUser.uid);

      emit(UserState(currentUser: newUser, auth: auth));
      await Future<void>.delayed(const Duration(milliseconds: 100));

      print("${newUser.getEmail}${newUser.getUserId}");
      print("${state.currentUser.getEmail}${state.currentUser.getUserId}");
      if (context.mounted) context.go('/home');
    }
  }

  Future<void> onLogOut(BuildContext context) async {
    final AuthServicesInterface auth = state.auth;
    await auth.signOut();
    _currentUserChanged(MyUser(), auth);
    if (context.mounted) context.go('/login');
  }

  _currentUserChanged(MyUser myUser, AuthServicesInterface auth) {
    emit(state.copyWith(currentUser: myUser, auth: auth));
  }
}
