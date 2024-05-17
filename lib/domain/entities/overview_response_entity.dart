import 'package:book/domain/entities/results_entity.dart';

class OverviewResponseEntity {
  String status;
  String copyright;
  int numResults;
  ResultsEntity results;
  get getStatus => status;

  set setStatus(status) => this.status = status;

  get getCopyright => copyright;

  set setCopyright(copyright) => this.copyright = copyright;

  get getNumResults => numResults;

  set setNumResults(numResults) => this.numResults = numResults;

  get getResults => results;

  set setResults(results) => this.results = results;

  OverviewResponseEntity({
    required this.status,
    required this.copyright,
    required this.numResults,
    required this.results,
  });
}
