import 'package:book/domain/entities/overview_response_entity.dart';
import 'package:book/infrastructure/mappers/results_mapper.dart';
import 'package:book/infrastructure/models/overview_response_model.dart';

class OverviewResponseMapper {
  static OverviewResponseEntity modelToEntity(OverviewResponseModel response) =>
      OverviewResponseEntity(
          status: response.status,
          copyright: response.copyright,
          numResults: response.numResults,
          results: ResultsMapper.modelToEntity(response.results));
}
