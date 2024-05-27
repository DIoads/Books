import 'package:book/domain/entities/entities.dart';
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
    final ResultsEntity results =
        ref.watch(overviewResponseNotifierProvider).getResults;

    final List<ListElementEntity> lists = results.getLists;
    final List<BookEntity> books = lists.first.getBooks;

    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        // ListView.builder(
        //     itemCount: books.length,
        //     itemBuilder: ((context, index) {
        //       BookEntity book = books[index];
        //       return Text(book.getTitle);
        //     }))
        Text('Libro1'), Text('Libro1'), Text('Libro1'), Text('Libro1'),
        Text('Libro1'),
      ]),
    );
  }
}
