import 'package:book/domain/entities/book_entity.dart';
import 'package:book/domain/entities/buy_link_entity.dart';
import 'package:flutter/material.dart';

class LibroScreen extends StatelessWidget {
  final String name = "libro";

  const LibroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Libro'),
        ),
        body: const LibroScreenView(),
      ),
    );
  }
}

class LibroScreenView extends StatelessWidget {
  const LibroScreenView({super.key});

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
        contributor: 'director',
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

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 10,
      child: ClipRRect(
        // Los bordes del contenido del card se cortan usando BorderRadius
        borderRadius: BorderRadius.circular(30),

        child: Column(
          children: <Widget>[
            IconButton.outlined(
                onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            SizedBox(
              width: 250,
              //height: 500,
              child: Card(
                child: Wrap(
                  children: [
                    Image.network(book.getBookImage),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(book.getTitle),
              subtitle: Text(book.getContributor),
            ),
            Text(book.getTitle),
            Text(book.getContributor),
            Text(book.getAuthor),
            Text(book.getDescription)
          ],
        ),
      ),
    );
  }
}
