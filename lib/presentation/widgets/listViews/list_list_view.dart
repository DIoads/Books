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
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SizedBox(
      height: height * 0.78,
      width: width,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              controller: controller,
              itemCount: resultsList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Text(resultsList[index].displayName),
                    BookList(bookList: resultsList[index].getBooks),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
