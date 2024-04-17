import 'package:book/infrastructure/auth/firebase_auth_services.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> with CustomGestureDetector {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          FormContainerWidget(
            controller: _emailController,
            hintText: "Email",
            isPasswordField: false,
          ),
          const SizedBox(
            height: 10,
          ),
          FormContainerWidget(
            controller: _passwordController,
            hintText: "Password",
            isPasswordField: true,
          ),
          const SizedBox(
            height: 10,
          ),
          iconlessGestureDetector(() => _signIn(context), _isSigning, 'Login'),
          const SizedBox(
            height: 10,
          ),
          iconGestureDetector(() {
            // _signInWithGoogle(context);
            // falta resolver error de google sign in.
          }, "Sign in with google", FontAwesomeIcons.google),
          const SizedBox(
            height: 20,
          ),
          CustomRows(
              mainText: "Don't have an account?",
              pressText: 'Sign Up',
              onpress: () => context.push('/signup'))
        ]),
      ),
    );
  }

  Future<void> _signIn(BuildContext context) async {
    final size = (MediaQuery.of(context).size.width / 24);

    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });
    if (user != null) {
      showToast(message: "User is successfully signed in", textSize: size);
      if (context.mounted) context.go('/home');
    } else {
      showToast(message: "some error occured", textSize: size);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final size = (MediaQuery.of(context).size.width / 24);

    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        if (context.mounted) context.go('/home');
      }
    } catch (e) {
      showToast(message: "some error occured $e", textSize: size);
    }
  }
}
