import 'package:book/presentation/widgets/scrollviews/list_list.dart';
import 'package:flutter/material.dart';

class Recomendation extends StatefulWidget {
  const Recomendation({super.key});
  final String name = "recomendacion";

  @override
  State<Recomendation> createState() => _RecomendationState();
}

class _RecomendationState extends State<Recomendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: const SafeArea(
        child: ListList(),
      ),
    );
  }
}
