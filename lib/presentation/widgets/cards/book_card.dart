import 'package:book/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final BookEntity currentBook;
  const BookCard({super.key, required this.currentBook});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;

    return Card(
      child: SizedBox(
        height: height / 5,
        width: width / 2,
        child: Center(child: Text(currentBook.getTitle)),
      ),
    );
  }
}
