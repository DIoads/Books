import 'package:book/domain/entities/results_entity.dart';
import 'package:book/presentation/providers/overview_response_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookListView extends ConsumerStatefulWidget {
  const BookListView({
    super.key,
  });

  @override
  BookListViewState createState() => BookListViewState();
}

class BookListViewState extends ConsumerState<BookListView> {
  @override
  Widget build(BuildContext context) {
    final ResultsEntity? results =
        ref.watch(overviewResponseNotifierProvider).getResults;
    final lists = results?.getLists!;
    final books = lists.first.getBooks;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Expanded(
            child: ListView.builder(
          itemCount: books.length(),
          itemBuilder: ((context, index) {
            return Text(books[index].getTitle);
          }),
        ))
      ]),
    );
  }
}
