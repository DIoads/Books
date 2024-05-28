import 'package:book/domain/entities/book_entity.dart';
import 'package:book/domain/entities/buy_link_entity.dart';
import 'package:book/presentation/widgets/cards/book_card.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  const BookList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BookEntity book = BookEntity(
        ageGroup: '',
        amazonProductUrl: '',
        articleChapterLink: ' ',
        author: 'Julia Roberts',
        bookImage:
            'https://upload.wikimedia.org/wikipedia/commons/c/c9/Julia_Roberts_Cannes_2016_3.jpg',
        bookImageWidth: 0,
        bookImageHeight: 0,
        bookReviewLink: '0',
        contributor: '',
        contributorNote: '',
        createdDate: DateTime.now(),
        description: 'Mujer peliroja buenasa',
        firstChapterLink: '',
        price: '',
        primaryIsbn10: '',
        primaryIsbn13: '',
        bookUri: '',
        publisher: '',
        rank: 1,
        rankLastWeek: 1,
        sundayReviewLink: '',
        title: 'Mujer bonita',
        updatedDate: DateTime.now(),
        weeksOnList: 0,
        buyLinks: [BuyLinkEntity.emptyLinks()]);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          BookCard(book: book),
        ],
      ),
    );
  }
}
