import 'package:book/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final BookEntity currentBook;
  const BookCard({super.key, required this.currentBook});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(child: Text(currentBook.getTitle)),
      ),
    );
  }
}
