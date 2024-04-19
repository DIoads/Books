import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  @override
  SignupViewState createState() => SignupViewState();
}

class SignupViewState extends ConsumerState<SignupView>
    with CustomGestureDetector {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    ref.read(userNotifierProvider);
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
            iconlessnlGestureDetector(() {
              ref.watch(userNotifierProvider.notifier).signUp(
                  context, _emailController.text, _passwordController.text);
            }, 'Sign Up'),
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
}
