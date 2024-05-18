import 'package:book/domain/datasources/overview_response_datasource.dart';
import 'package:book/domain/entities/overview_response_entity.dart';
import 'package:book/domain/repositories/overview_response_repository.dart';

class OverviewResponseRepositoryImpl extends OverviewResponseRepository {
  final OverviewResponseDatasource datasource;
  OverviewResponseRepositoryImpl(this.datasource);

  @override
  Future<OverviewResponseEntity> getOverViewResponse() {
    return datasource.getBestSellersNow();
  }
}
