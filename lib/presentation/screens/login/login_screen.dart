import 'package:book/presentation/views/login/login_view.dart';
import 'package:book/presentation/widgets/appBars/custom_app_bar.dart';
import 'package:book/presentation/widgets/gesture/gesture_detector.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final String name = "Login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with CustomAppBar, CustomGestureDetector {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
        child: Scaffold(
      appBar: appBarWithOutReturnButton(
          title: "Login", backgroundcolor: colors.onPrimary),
      body: const LoginView(),
    ));
  }
}
