import 'package:book/domain/datasources/overview_response_datasource.dart';
import 'package:book/domain/entities/overview_response_entity.dart';
import 'package:book/infrastructure/mappers/overview_response_mapper.dart';
import 'package:book/infrastructure/models/overview_response_model.dart';
import 'package:dio/dio.dart';

class OverviewResponseDatasourceImpl extends OverviewResponseDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.nytimes.com/svc/books/v3',
      queryParameters: {
        'api-key': 'Hrnuk9MgMV7QoFeRZqYEG5adeb2AisTP',
      }));

  OverviewResponseEntity _jsonToOverviewResponseEntity(
      Map<String, dynamic> json) {
    final overViewResponse = OverviewResponseModel.fromJson(json);

    return OverviewResponseMapper.modelToEntity(overViewResponse);
  }

  @override
  Future<OverviewResponseEntity> getBestSellersNow() async {
    final response = await dio.get('/lists/overview.json');

    return _jsonToOverviewResponseEntity(response.data);
  }
}
