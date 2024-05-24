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

//HORIZONTALMENTE+++++++++++++++++

class _RecomendationState extends State<Recomendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: Container(
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: const Center(
                    child: Text(
                      "ListView 1",
                      style: TextStyle(fontSize: 32, color: Colors.amber),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: const Center(
                    child: Text(
                      "ListView 2",
                      style: TextStyle(fontSize: 32, color: Colors.amber),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: const Center(
                    child: Text(
                      "ListView 3",
                      style: TextStyle(fontSize: 32, color: Colors.amber),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: const Center(
                    child: Text(
                      "ListView 4",
                      style: TextStyle(fontSize: 32, color: Colors.amber),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  child: const Center(
                    child: Text(
                      "ListView 5",
                      style: TextStyle(fontSize: 32, color: Colors.amber),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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