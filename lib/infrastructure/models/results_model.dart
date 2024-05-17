import 'package:book/infrastructure/models/list_model.dart';

class ResultsModel {
  DateTime bestsellersDate;
  DateTime publishedDate;
  String publishedDateDescription;
  DateTime previousPublishedDate;
  String nextPublishedDate;
  List<ListElementModel> lists;

  ResultsModel({
    required this.bestsellersDate,
    required this.publishedDate,
    required this.publishedDateDescription,
    required this.previousPublishedDate,
    required this.nextPublishedDate,
    required this.lists,
  });

  factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
        bestsellersDate: DateTime.parse(json["bestsellers_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        publishedDateDescription: json["published_date_description"],
        previousPublishedDate: DateTime.parse(json["previous_published_date"]),
        nextPublishedDate: json["next_published_date"],
        lists: List<ListElementModel>.from(
            json["lists"].map((x) => ListElementModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bestsellers_date":
            "${bestsellersDate.year.toString().padLeft(4, '0')}-${bestsellersDate.month.toString().padLeft(2, '0')}-${bestsellersDate.day.toString().padLeft(2, '0')}",
        "published_date":
            "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "published_date_description": publishedDateDescription,
        "previous_published_date":
            "${previousPublishedDate.year.toString().padLeft(4, '0')}-${previousPublishedDate.month.toString().padLeft(2, '0')}-${previousPublishedDate.day.toString().padLeft(2, '0')}",
        "next_published_date": nextPublishedDate,
        "lists": List<dynamic>.from(lists.map((x) => x.toJson())),
      };
}
