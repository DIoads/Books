class BuyLink {
  String name;
  String url;

  BuyLink({
    required this.name,
    required this.url,
  });

  factory BuyLink.fromJson(Map<String, dynamic> json) => BuyLink(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
