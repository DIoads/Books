import 'dart:convert';

import 'package:book/infrastructure/models/results_model.dart';

OverviewResponseModel overviewResponseFromJson(String str) =>
    OverviewResponseModel.fromJson(json.decode(str));

String overviewResponseToJson(OverviewResponseModel data) =>
    json.encode(data.toJson());

class OverviewResponseModel {
  String status;
  String copyright;
  int numResults;
  ResultsModel results;

  OverviewResponseModel({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  factory OverviewResponseModel.fromJson(Map<String, dynamic> json) =>
      OverviewResponseModel(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        results: ResultsModel.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": results.toJson(),
      };
}
