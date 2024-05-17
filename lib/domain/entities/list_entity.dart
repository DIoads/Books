import 'package:book/domain/entities/book_entity.dart';

class ListElementEntity {
  int listId;
  String listName;
  String listNameEncoded;
  String displayName;
  String updated;
  dynamic listImage;
  dynamic listImageWidth;
  dynamic listImageHeight;
  List<BookEntity> books;

  int get getListId => listId;

  set setListId(int listId) => this.listId = listId;

  get getListName => listName;

  set setListName(listName) => this.listName = listName;

  get getListNameEncoded => listNameEncoded;

  set setListNameEncoded(listNameEncoded) =>
      this.listNameEncoded = listNameEncoded;

  get getDisplayName => displayName;

  set setDisplayName(displayName) => this.displayName = displayName;

  get getUpdated => updated;

  set setUpdated(updated) => this.updated = updated;

  get getListImage => listImage;

  set setListImage(listImage) => this.listImage = listImage;

  get getListImageWidth => listImageWidth;

  set setListImageWidth(listImageWidth) => this.listImageWidth = listImageWidth;

  get getListImageHeight => listImageHeight;

  set setListImageHeight(listImageHeight) =>
      this.listImageHeight = listImageHeight;

  get getBooks => books;

  set setBooks(books) => this.books = books;
  ListElementEntity({
    required this.listId,
    required this.listName,
    required this.listNameEncoded,
    required this.displayName,
    required this.updated,
    required this.listImage,
    required this.listImageWidth,
    required this.listImageHeight,
    required this.books,
  });
}
