import 'package:book/domain/entities/book_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookProvider =
    StateNotifierProvider<BookNotifier, BookEntity>((ref) => BookNotifier());

class BookNotifier extends StateNotifier<BookEntity> {
  BookNotifier() : super(BookEntity.emptyBook());

  void bookChanged(BookEntity book) {
    state = book;
  }
}
