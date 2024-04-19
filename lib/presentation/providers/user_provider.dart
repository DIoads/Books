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
  final FirebaseAuthService _auth = FirebaseAuthService();

  UserNotifier() : super(MyUser());

  Future<void> logIn(
      BuildContext context, String email, String password) async {
    User? user = await _auth.logInWithEmailAndPassword(email, password);

    if (user != null) {
      state =
          MyUser(userId: user.uid, name: user.displayName, eMail: user.email);

      if (context.mounted) context.go('/home');
    }
  }

  Future<void> logOut(BuildContext context) async {
    _auth.signOut();
    context.go('/login');
  }
}

  // Future<void> _signInWithGoogle(BuildContext context) async {
  //   final size = (MediaQuery.of(context).size.width / 24);

  //   final GoogleSignIn googleSignIn = GoogleSignIn();

  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();

  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;

  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken,
  //       );

  //       await _firebaseAuth.signInWithCredential(credential);
  //       if (context.mounted) context.go('/home');
  //     }
  //   } catch (e) {
  //     showToast(message: "some error occured $e", textSize: size);
  //   }
  // }

