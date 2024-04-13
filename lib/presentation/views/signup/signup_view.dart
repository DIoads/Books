import 'package:book/infrastructure/auth/firebase_auth_services.dart';
import 'package:book/presentation/widgets/forms/form_container_widget.dart';
import 'package:book/presentation/widgets/gesture/gesture_detector.dart';
import 'package:book/presentation/widgets/row/row.dart';
import 'package:book/presentation/widgets/toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> with CustomGestureDetector {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _auth = FirebaseAuthService();

  bool isSigningUp = false;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 10,
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
              height: 30,
            ),
            iconlessGestureDetector(() {
              _signUp(context);
            }, isSigningUp, 'Sign Up'),
            const SizedBox(
              height: 20,
            ),
            CustomRows(
                mainText: 'Already have an account?',
                pressText: 'Login',
                onpress: () => context.go('/login'))
          ],
        ),
      ),
    );
  }

  Future<void> _signUp(BuildContext context) async {
    final size = (MediaQuery.of(context).size.width / 24);

    setState(() {
      isSigningUp = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created", textSize: size);
      if (context.mounted) context.go('/home');
    } else {
      showToast(message: "Some error happend", textSize: size);
    }
  }
}
