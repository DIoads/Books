import 'package:book/presentation/widgets/appBars/custom_app_bar.dart';
import 'package:book/presentation/widgets/forms/login_form.dart';
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
      body: const _LoginView(),
    ));
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogInForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
