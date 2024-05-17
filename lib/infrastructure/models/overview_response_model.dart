import 'dart:convert';

import 'package:book/infrastructure/models/results_model.dart';

OverviewResponse overviewResponseFromJson(String str) =>
    OverviewResponse.fromJson(json.decode(str));

String overviewResponseToJson(OverviewResponse data) =>
    json.encode(data.toJson());

class OverviewResponse {
  String status;
  String copyright;
  int numResults;
  Results results;

  OverviewResponse({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });

  factory OverviewResponse.fromJson(Map<String, dynamic> json) =>
      OverviewResponse(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": results.toJson(),
      };
}
