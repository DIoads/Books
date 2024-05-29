import 'package:book/domain/entities/book_entity.dart';
import 'package:book/presentation/providers/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookCard extends ConsumerStatefulWidget {
  final BookEntity currentBook;
  const BookCard({super.key, required this.currentBook});

  @override
  BookCardState createState() => BookCardState();
}

class BookCardState extends ConsumerState<BookCard> {
  @override
  Widget build(BuildContext context) {
    final BookNotifier bookNotifier = ref.watch(bookNotifierProvider.notifier);

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
                widget.currentBook.getTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 1, 95, 177),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image(
                  image: NetworkImage(widget.currentBook.getBookImage),
                  width: width / 3,
                  height: height / 14),
              SizedBox(
                height: height / 20,
                width: width / 4.5,
                child: TextButton(
                  onPressed: () async {
                    bookNotifier.bookChanged(widget.currentBook);
                    context.push('/book');
                  },
                  //child: const Text('Enabled'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 164, 187, 214))),
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
