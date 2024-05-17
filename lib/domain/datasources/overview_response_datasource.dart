import 'package:book/domain/entities/overview_response_entity.dart';

abstract class OverviewResponseDatasource {
  Future<OverviewResponseEntity> getBestSellersNow();
}
