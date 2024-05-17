import 'package:book/domain/entities/buy_link_entity.dart';
import 'package:book/infrastructure/models/buy_link_model.dart';

class BuyLinkMapper {
  static BuyLinkEntity modelToEntity(BuyLinkModel buylink) =>
      BuyLinkEntity(name: buylink.name, url: buylink.url);
}
