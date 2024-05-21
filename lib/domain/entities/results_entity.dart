import 'package:book/domain/entities/list_entity.dart';

class ResultsEntity {
  DateTime bestsellersDate;
  DateTime publishedDate;
  String publishedDateDescription;
  DateTime previousPublishedDate;
  String nextPublishedDate;
  List<ListElementEntity> lists;
  get getBestsellersDate => bestsellersDate;

  set setBestsellersDate(bestsellersDate) =>
      this.bestsellersDate = bestsellersDate;

  get getPublishedDate => publishedDate;

  set setPublishedDate(publishedDate) => this.publishedDate = publishedDate;

  get getPublishedDateDescription => publishedDateDescription;

  set setPublishedDateDescription(publishedDateDescription) =>
      this.publishedDateDescription = publishedDateDescription;

  get getPreviousPublishedDate => previousPublishedDate;

  set setPreviousPublishedDate(previousPublishedDate) =>
      this.previousPublishedDate = previousPublishedDate;

  get getNextPublishedDate => nextPublishedDate;

  set setNextPublishedDate(nextPublishedDate) =>
      this.nextPublishedDate = nextPublishedDate;

  get getLists => lists;

  set setLists(lists) => this.lists = lists;

  ResultsEntity({
    required this.bestsellersDate,
    required this.publishedDate,
    required this.publishedDateDescription,
    required this.previousPublishedDate,
    required this.nextPublishedDate,
    required this.lists,
  });

  factory ResultsEntity.emptyResults() => ResultsEntity(
      bestsellersDate: DateTime.now(),
      publishedDate: DateTime.now(),
      publishedDateDescription: '',
      previousPublishedDate: DateTime.now(),
      nextPublishedDate: '',
      lists: [ListElementEntity.emptyList()]);
}
