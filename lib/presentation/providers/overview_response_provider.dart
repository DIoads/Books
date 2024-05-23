import 'package:book/domain/entities/overview_response_entity.dart';
import 'package:book/domain/repositories/overview_response_repository.dart';
import 'package:book/infrastructure/datasources/overview_response_datasource_impl.dart';
import 'package:book/infrastructure/repositories/overview_response_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final overviewResponseNotifierProvider =
    StateNotifierProvider<OverviewResponseNotifier, OverviewResponseEntity>(
        (ref) => OverviewResponseNotifier());

class OverviewResponseNotifier extends StateNotifier<OverviewResponseEntity> {
  final OverviewResponseRepository responseRepository =
      OverviewResponseRepositoryImpl(OverviewResponseDatasourceImpl());
  OverviewResponseNotifier() : super(OverviewResponseEntity.emptyResponse());

  Future<void> initialLoad() async {
    state = await responseRepository.getOverViewResponse();
  }
}
