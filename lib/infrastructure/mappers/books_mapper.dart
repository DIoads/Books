import 'package:book/domain/entities/book_entity.dart';
import 'package:book/infrastructure/mappers/buy_link_mapper.dart';
import 'package:book/infrastructure/models/book_model.dart';

class BooksMapper {
  static BookEntity modelToEntity(BookModel book) => BookEntity(
      ageGroup: book.ageGroup,
      amazonProductUrl: book.amazonProductUrl,
      articleChapterLink: book.articleChapterLink,
      author: book.author,
      bookImage: book.bookImage,
      bookImageWidth: book.bookImageWidth,
      bookImageHeight: book.bookImageHeight,
      bookReviewLink: book.bookReviewLink,
      contributor: book.contributor,
      contributorNote: book.contributorNote,
      createdDate: book.createdDate,
      description: book.description,
      firstChapterLink: book.firstChapterLink,
      price: book.price,
      primaryIsbn10: book.primaryIsbn10,
      primaryIsbn13: book.primaryIsbn13,
      bookUri: book.bookUri,
      publisher: book.publisher,
      rank: book.rank,
      rankLastWeek: book.rankLastWeek,
      sundayReviewLink: book.sundayReviewLink,
      title: book.title,
      updatedDate: book.updatedDate,
      weeksOnList: book.weeksOnList,
      buyLinks: book.buyLinks
          .map(
            (e) => BuyLinkMapper.modelToEntity(e),
          )
          .toList());
}
