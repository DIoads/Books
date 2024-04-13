import 'package:book/presentation/views/signup/signup_view.dart';
import 'package:book/presentation/widgets/appBars/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget with CustomAppBar {
  final String name = "Signup";

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: appBarWithReturnButton(
            title: "Sign Up", backgroundcolor: colors.onPrimary),
        body: const SignupView());
  }
}
