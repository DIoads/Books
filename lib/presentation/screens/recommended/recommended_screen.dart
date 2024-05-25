import 'package:book/presentation/widgets/scrollviews/list_view.dart';
import 'package:flutter/material.dart';

class RecommendedScreen extends StatelessWidget {
  final String name = "recomendacion";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: RecommendedScreen(),
    );
  }
}

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
