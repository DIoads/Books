import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServicesInterface {
  Future<User?> signUpWithEmailAndPassword(String email, String password);
  Future<User?> logInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}
