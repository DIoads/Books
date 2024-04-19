import 'package:book/presentation/views/home/home_view.dart';
import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String name = "Home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with CustomAppBar, CustomGestureDetector {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
        child: Scaffold(
      appBar: appBarWithOutReturnButton(
          title: "Home", backgroundcolor: colors.onPrimary),
      body: const HomeView(),
    ));
  }
}
