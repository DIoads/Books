import 'package:book/domain/entities/entities.dart';
import 'package:book/presentation/widgets/listViews/book_list_view.dart';
import 'package:flutter/material.dart';

class ListList extends StatelessWidget {
  final ResultsEntity results;
  const ListList({
    super.key,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          BookList(list: results.lists.first),
        ],
      ),
    );
  }
}
