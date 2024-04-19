import 'package:book/presentation/providers/user_provider.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogInView extends ConsumerStatefulWidget {
  const LogInView({super.key});

  @override
  LogInFormState createState() => LogInFormState();
}

class LogInFormState extends ConsumerState<LogInView>
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
          iconlessnlGestureDetector(() {
            ref.watch(userNotifierProvider.notifier).logIn(
                context, _emailController.text, _passwordController.text);
          }, 'Log In'),
          const SizedBox(
            height: 10,
          ),
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
}
