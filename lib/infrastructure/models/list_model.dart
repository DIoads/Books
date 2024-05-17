import 'package:book/infrastructure/models/book_model.dart';

class ListElementModel {
  int listId;
  String listName;
  String listNameEncoded;
  String displayName;
  String updated;
  dynamic listImage;
  dynamic listImageWidth;
  dynamic listImageHeight;
  List<BookModel> books;

  ListElementModel({
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

  factory ListElementModel.fromJson(Map<String, dynamic> json) =>
      ListElementModel(
        listId: json["list_id"],
        listName: json["list_name"],
        listNameEncoded: json["list_name_encoded"],
        displayName: json["display_name"],
        updated: json["updated"],
        listImage: json["list_image"],
        listImageWidth: json["list_image_width"],
        listImageHeight: json["list_image_height"],
        books: List<BookModel>.from(
            json["books"].map((x) => BookModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list_id": listId,
        "list_name": listName,
        "list_name_encoded": listNameEncoded,
        "display_name": displayName,
        "updated": updated,
        "list_image": listImage,
        "list_image_width": listImageWidth,
        "list_image_height": listImageHeight,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
      };
}
