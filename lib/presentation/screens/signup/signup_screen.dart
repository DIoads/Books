import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget with CustomAppBar {
  final String name = "Signup";
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: appBarWithReturnButton(
            title: name, backgroundcolor: colors.onPrimary),
        body: const _SignupView());
  }
}

class _SignupView extends StatelessWidget {
  const _SignupView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SignUpForm(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
