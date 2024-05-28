import 'package:book/domain/entities/entities.dart';
import 'package:book/presentation/widgets/listViews/book_list_view.dart';
import 'package:flutter/material.dart';

class ListList extends StatelessWidget {
  final List<ListElementEntity> resultsList;
  const ListList({
    super.key,
    required this.resultsList,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();

    return SizedBox(
      height: 800,
      width: 400,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              controller: controller,
              itemCount: resultsList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return BookList(bookList: resultsList[index].getBooks);
              },
            ),
          ),
          //BookList(bookList: resultsList.first.getBooks),
        ],
      ),
    );
  }
}
