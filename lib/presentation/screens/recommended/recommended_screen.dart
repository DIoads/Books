import 'package:flutter/material.dart';

class RecommendedScreen extends StatelessWidget {
  final String name = "recomendacion";

  const RecommendedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vertical & Horizontal Scroll Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Vertical & Horizontal Scroll"),
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
