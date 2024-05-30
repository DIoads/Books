import 'package:book/domain/auth/auth_services_interface.dart';
import 'package:book/presentation/widgets/toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements AuthServicesInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      showToast(message: 'Account created successfully!.', textSize: 16);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(
            message: 'The email address is already in use.', textSize: 16);
      } else {
        showToast(message: 'An error occurred: ${e.code}', textSize: 16);
      }
    }
    return null;
  }

  @override
  Future<User?> logInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      showToast(message: 'Log in successful!.', textSize: 16);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.', textSize: 16);
      } else {
        showToast(message: 'An error occurred: ${e.code}', textSize: 16);
      }
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  User? getCurrentUser() {
    User? currentUser = _auth.currentUser;
    return currentUser;
  }

  @override
  Future<void> deleteUser() async {
    await _auth.currentUser?.delete();
  }
}
