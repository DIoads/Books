import 'package:book/presentation/widgets/cards/book_card.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  const BookList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
          BookCard(cardName: 'Elevated Card'),
        ],
      ),
    );
  }
}
