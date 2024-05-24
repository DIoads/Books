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

  @override
  State<Recomendation> createState() => _RecomendationState();
}

class _RecomendationState extends State<Recomendation> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
/*

class RecommendedScreen extends StatelessWidget {
  final String name = "recomendacion";

  const RecommendedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vertical & Horizontal Scroll En construcción',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Vertical & Horizontal En construcción"),
        ),
        body: Builder(builder: (context) {
          return const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('data'),
                  SizedBox(
                    height: 20,
                  ),
                  Text('data'),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Text('data'),
              SizedBox(
                height: 20,
              ),
              Text('data'),
            ]),
          );
        }),
      ),
    );
  }
}
*/