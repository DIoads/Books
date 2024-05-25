import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 400,
        height: 200,
        child: Center(child: Text(cardName)),
      ),
    );
  }
}
