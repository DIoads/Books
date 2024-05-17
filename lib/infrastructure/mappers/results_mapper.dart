import 'package:book/domain/entities/results_entity.dart';
import 'package:book/infrastructure/mappers/lists_mapper.dart';
import 'package:book/infrastructure/models/results_model.dart';

class ResultsMapper {
  static ResultsEntity modelToEntity(ResultsModel results) => ResultsEntity(
      bestsellersDate: results.bestsellersDate,
      publishedDate: results.publishedDate,
      publishedDateDescription: results.publishedDateDescription,
      previousPublishedDate: results.previousPublishedDate,
      nextPublishedDate: results.nextPublishedDate,
      lists: results.lists.map((e) => ListsMapper.modelToEntity(e)).toList());
}
