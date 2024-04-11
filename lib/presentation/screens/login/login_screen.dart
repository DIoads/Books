import 'package:book/config/auth_services/firebase_auth_services.dart';
import 'package:book/presentation/widgets/appBars/custom_app_bar.dart';
import 'package:book/presentation/widgets/forms/form_container_widget.dart';
import 'package:book/presentation/widgets/gesture/gesture_detector.dart';
import 'package:book/presentation/widgets/row/row.dart';
import 'package:book/presentation/widgets/toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  final String name = "Login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with CustomAppBar, CustomGestureDetector {
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
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
        child: Scaffold(
            appBar: appBarWithOutReturnButton(
                title: "Login", backgroundcolor: colors.onPrimary),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
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
                      iconlessGestureDetector(
                          () => _signIn(context), _isSigning, 'Login'),
                      const SizedBox(
                        height: 10,
                      ),
                      iconGestureDetector(() {
                        _signInWithGoogle(context);
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
            )));
  }

  Future<void> _signIn(BuildContext context) async {
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
      showToast(message: "User is successfully signed in");
      if (context.mounted) context.pushReplacement('/home');
    } else {
      showToast(message: "some error occured");
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
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
        if (context.mounted) context.pushReplacement('/home');
      }
    } catch (e) {
      showToast(message: "some error occured $e");
    }
  }
}
