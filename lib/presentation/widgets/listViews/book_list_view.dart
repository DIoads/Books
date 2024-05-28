import 'package:book/domain/entities/entities.dart';
import 'package:book/presentation/widgets/cards/book_card.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  final ListElementEntity list;
  const BookList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            BookCard(currentBook: list.books[0]),
            BookCard(currentBook: list.books[0]),
            BookCard(currentBook: list.books[0]),
            BookCard(currentBook: list.books[0]),

            /* ListView.builder(
              itemCount: list.getBooks.length,
              itemBuilder: (BuildContext context, int index) {
                return BookCard(currentBook: list.books[index]);
              },
            )*/
          ],
        ),
      ),
    );
  }
}
