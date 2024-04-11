import 'package:book/config/auth_services/firebase_auth_services.dart';
import 'package:book/presentation/widgets/appBars/custom_app_bar.dart';
import 'package:book/presentation/widgets/forms/form_container_widget.dart';
import 'package:book/presentation/widgets/gesture/gesture_detector.dart';
import 'package:book/presentation/widgets/row/row.dart';
import 'package:book/presentation/widgets/toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  final String name = "Signup";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with CustomGestureDetector, CustomAppBar {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: appBarWithReturnButton(
          title: "Sign Up", backgroundcolor: colors.onPrimary),
      body: Center(
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
                  onpress: () => context.pushReplacement('/login'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signUp(BuildContext context) async {
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
      showToast(message: "User is successfully created");
      if (context.mounted) context.pushReplacement('/home');
    } else {
      showToast(message: "Some error happend");
    }
  }
}
