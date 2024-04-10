import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String name = "Home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Home Screen"),
    );
  }
}
