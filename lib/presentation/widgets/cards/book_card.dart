import 'package:book/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.cardName, required this.actualBook});
  final String cardName;
  final BookEntity actualBook;

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
