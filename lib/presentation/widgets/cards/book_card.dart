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
      child: Card(
        elevation: 30,
        shadowColor: Colors.black,
        color: Colors.greenAccent[100],
        child: SizedBox(
          height: height / 5,
          width: width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //  mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentBook.getTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.green[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image(
                  image: NetworkImage(currentBook.getBookImage),
                  width: width / 3,
                  height: height / 14),
              SizedBox(
                height: height / 20,
                width: width / 4.5,
                child: TextButton(
                  onPressed: () {},
                  //child: const Text('Enabled'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  child: const Text('Detalles'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
