import 'package:book/infrastructure/models/buy_link_model.dart';

class Book {
  String ageGroup;
  String amazonProductUrl;
  String articleChapterLink;
  String author;
  String bookImage;
  int bookImageWidth;
  int bookImageHeight;
  String bookReviewLink;
  String contributor;
  String contributorNote;
  DateTime createdDate;
  String description;
  String firstChapterLink;
  String price;
  String primaryIsbn10;
  String primaryIsbn13;
  String bookUri;
  String publisher;
  int rank;
  int rankLastWeek;
  String sundayReviewLink;
  String title;
  DateTime updatedDate;
  int weeksOnList;
  List<BuyLink> buyLinks;

  Book({
    required this.ageGroup,
    required this.amazonProductUrl,
    required this.articleChapterLink,
    required this.author,
    required this.bookImage,
    required this.bookImageWidth,
    required this.bookImageHeight,
    required this.bookReviewLink,
    required this.contributor,
    required this.contributorNote,
    required this.createdDate,
    required this.description,
    required this.firstChapterLink,
    required this.price,
    required this.primaryIsbn10,
    required this.primaryIsbn13,
    required this.bookUri,
    required this.publisher,
    required this.rank,
    required this.rankLastWeek,
    required this.sundayReviewLink,
    required this.title,
    required this.updatedDate,
    required this.weeksOnList,
    required this.buyLinks,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        ageGroup: json["age_group"],
        amazonProductUrl: json["amazon_product_url"],
        articleChapterLink: json["article_chapter_link"],
        author: json["author"],
        bookImage: json["book_image"],
        bookImageWidth: json["book_image_width"],
        bookImageHeight: json["book_image_height"],
        bookReviewLink: json["book_review_link"],
        contributor: json["contributor"],
        contributorNote: json["contributor_note"],
        createdDate: DateTime.parse(json["created_date"]),
        description: json["description"],
        firstChapterLink: json["first_chapter_link"],
        price: json["price"],
        primaryIsbn10: json["primary_isbn10"],
        primaryIsbn13: json["primary_isbn13"],
        bookUri: json["book_uri"],
        publisher: json["publisher"],
        rank: json["rank"],
        rankLastWeek: json["rank_last_week"],
        sundayReviewLink: json["sunday_review_link"],
        title: json["title"],
        updatedDate: DateTime.parse(json["updated_date"]),
        weeksOnList: json["weeks_on_list"],
        buyLinks: List<BuyLink>.from(
            json["buy_links"].map((x) => BuyLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "age_group": ageGroup,
        "amazon_product_url": amazonProductUrl,
        "article_chapter_link": articleChapterLink,
        "author": author,
        "book_image": bookImage,
        "book_image_width": bookImageWidth,
        "book_image_height": bookImageHeight,
        "book_review_link": bookReviewLink,
        "contributor": contributor,
        "contributor_note": contributorNote,
        "created_date": createdDate.toIso8601String(),
        "description": description,
        "first_chapter_link": firstChapterLink,
        "price": price,
        "primary_isbn10": primaryIsbn10,
        "primary_isbn13": primaryIsbn13,
        "book_uri": bookUri,
        "publisher": publisher,
        "rank": rank,
        "rank_last_week": rankLastWeek,
        "sunday_review_link": sundayReviewLink,
        "title": title,
        "updated_date": updatedDate.toIso8601String(),
        "weeks_on_list": weeksOnList,
        "buy_links": List<dynamic>.from(buyLinks.map((x) => x.toJson())),
      };
}
