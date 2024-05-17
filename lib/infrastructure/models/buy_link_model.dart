class BuyLinkModel {
  String name;
  String url;

  BuyLinkModel({
    required this.name,
    required this.url,
  });

  factory BuyLinkModel.fromJson(Map<String, dynamic> json) => BuyLinkModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
