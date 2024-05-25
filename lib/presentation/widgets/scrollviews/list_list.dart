import 'package:book/presentation/widgets/scrollviews/book_list.dart';
import 'package:flutter/material.dart';

class ListList extends StatelessWidget {
  const ListList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          BookList(),
        ],
      ),
    );
  }
}
