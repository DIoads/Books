import 'package:book/domain/entities/entities.dart';
import 'package:book/presentation/widgets/cards/book_card.dart';
import 'package:flutter/material.dart';

class BookList extends StatelessWidget {
  final List<BookEntity> bookList;
  const BookList({
    super.key,
    required this.bookList,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;

    return SizedBox(
      height: height / 5,
      width: width,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: bookList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return BookCard(currentBook: bookList[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
