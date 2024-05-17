import 'package:book/domain/entities/list_entity.dart';
import 'package:book/infrastructure/mappers/books_mapper.dart';
import 'package:book/infrastructure/models/list_model.dart';

class ListsMapper {
  static ListElementEntity modelToEntity(ListElementModel listElement) =>
      ListElementEntity(
          listId: listElement.listId,
          listName: listElement.listName,
          listNameEncoded: listElement.listNameEncoded,
          displayName: listElement.displayName,
          updated: listElement.updated,
          listImage: listElement.listImage,
          listImageWidth: listElement.listImageWidth,
          listImageHeight: listElement.listImageHeight,
          books: listElement.books
              .map((e) => BooksMapper.modelToEntity(e))
              .toList());
}
