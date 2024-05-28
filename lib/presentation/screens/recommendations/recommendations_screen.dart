import 'package:book/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget with CustomAppBar {
  final String name = "Recommendations";

  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: appBarWithOutReturnButton(
            title: name, backgroundcolor: colors.onPrimary),
        body: const RecommendationsScreenView());
  }
}

class RecommendationsScreenView extends StatefulWidget {
  const RecommendationsScreenView({
    super.key,
  });

  @override
  State<RecommendationsScreenView> createState() =>
      _RecommendationsScreenViewState();
}

class _RecommendationsScreenViewState extends State<RecommendationsScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
