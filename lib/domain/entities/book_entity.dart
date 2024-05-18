import 'package:book/domain/entities/buy_link_entity.dart';

class BookEntity {
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
  List<BuyLinkEntity> buyLinks;

  String get getAgeGroup => ageGroup;

  set setAgeGroup(String ageGroup) => this.ageGroup = ageGroup;

  get getAmazonProductUrl => amazonProductUrl;

  set setAmazonProductUrl(amazonProductUrl) =>
      this.amazonProductUrl = amazonProductUrl;

  get getArticleChapterLink => articleChapterLink;

  set setArticleChapterLink(articleChapterLink) =>
      this.articleChapterLink = articleChapterLink;

  get getAuthor => author;

  set setAuthor(author) => this.author = author;

  get getBookImage => bookImage;

  set setBookImage(bookImage) => this.bookImage = bookImage;

  get getBookImageWidth => bookImageWidth;

  set setBookImageWidth(bookImageWidth) => this.bookImageWidth = bookImageWidth;

  get getBookImageHeight => bookImageHeight;

  set setBookImageHeight(bookImageHeight) =>
      this.bookImageHeight = bookImageHeight;

  get getBookReviewLink => bookReviewLink;

  set setBookReviewLink(bookReviewLink) => this.bookReviewLink = bookReviewLink;

  get getContributor => contributor;

  set setContributor(contributor) => this.contributor = contributor;

  get getContributorNote => contributorNote;

  set setContributorNote(contributorNote) =>
      this.contributorNote = contributorNote;

  get getCreatedDate => createdDate;

  set setCreatedDate(createdDate) => this.createdDate = createdDate;

  get getDescription => description;

  set setDescription(description) => this.description = description;

  get getFirstChapterLink => firstChapterLink;

  set setFirstChapterLink(firstChapterLink) =>
      this.firstChapterLink = firstChapterLink;

  get getPrice => price;

  set setPrice(price) => this.price = price;

  get getPrimaryIsbn10 => primaryIsbn10;

  set setPrimaryIsbn10(primaryIsbn10) => this.primaryIsbn10 = primaryIsbn10;

  get getPrimaryIsbn13 => primaryIsbn13;

  set setPrimaryIsbn13(primaryIsbn13) => this.primaryIsbn13 = primaryIsbn13;

  get getBookUri => bookUri;

  set setBookUri(bookUri) => this.bookUri = bookUri;

  get getPublisher => publisher;

  set setPublisher(publisher) => this.publisher = publisher;

  get getRank => rank;

  set setRank(rank) => this.rank = rank;

  get getRankLastWeek => rankLastWeek;

  set setRankLastWeek(rankLastWeek) => this.rankLastWeek = rankLastWeek;

  get getSundayReviewLink => sundayReviewLink;

  set setSundayReviewLink(sundayReviewLink) =>
      this.sundayReviewLink = sundayReviewLink;

  get getTitle => title;

  set setTitle(title) => this.title = title;

  get getUpdatedDate => updatedDate;

  set setUpdatedDate(updatedDate) => this.updatedDate = updatedDate;

  get getWeeksOnList => weeksOnList;

  set setWeeksOnList(weeksOnList) => this.weeksOnList = weeksOnList;

  get getBuyLinks => buyLinks;

  set setBuyLinks(buyLinks) => this.buyLinks = buyLinks;

  BookEntity({
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
  factory BookEntity.emptyBook() => BookEntity(
      ageGroup: '',
      amazonProductUrl: '',
      articleChapterLink: '',
      author: '',
      bookImage: '',
      bookImageWidth: 0,
      bookImageHeight: 0,
      bookReviewLink: '',
      contributor: '',
      contributorNote: '',
      createdDate: DateTime.now(),
      description: '',
      firstChapterLink: '',
      price: '',
      primaryIsbn10: '',
      primaryIsbn13: '',
      bookUri: '',
      publisher: '',
      rank: 0,
      rankLastWeek: 0,
      sundayReviewLink: '',
      title: '',
      updatedDate: DateTime.now(),
      weeksOnList: 0,
      buyLinks: [BuyLinkEntity.emptyLinks()]);
}
