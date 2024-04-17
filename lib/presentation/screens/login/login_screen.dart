import 'package:book/presentation/views/login/login_view.dart';
import 'package:book/presentation/widgets/appBars/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget with CustomAppBar {
  final String name = "Login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
        child: Scaffold(
      appBar: appBarWithOutReturnButton(
          title: "Login", backgroundcolor: colors.onPrimary),
      body: const LogInForm(),
    ));
  }
}
