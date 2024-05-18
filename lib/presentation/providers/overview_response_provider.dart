import 'package:book/domain/entities/overview_response_entity.dart';
import 'package:book/infrastructure/datasources/overview_response_datasource_impl.dart';
import 'package:book/infrastructure/mappers/overview_response_mapper.dart';
import 'package:book/infrastructure/models/overview_response_model.dart';
import 'package:book/infrastructure/repositories/overview_response_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final overviewResponseNotifierProvider =
    StateNotifierProvider<OverviewResponseNotifier, OverviewResponseEntity>(
        (ref) {
  final responseRepo =
      OverviewResponseRepositoryImpl(OverviewResponseDatasourceImpl());
  return OverviewResponseNotifier(
      getResponse: responseRepo.getOverViewResponse);
});

typedef GetResponseCallBack = Future<OverviewResponseEntity> Function();

class OverviewResponseNotifier extends StateNotifier<OverviewResponseEntity> {
  final GetResponseCallBack getResponse;

  OverviewResponseNotifier({required this.getResponse})
      : super(OverviewResponseMapper.modelToEntity(
            OverviewResponseModel.fromJson({})));
}
