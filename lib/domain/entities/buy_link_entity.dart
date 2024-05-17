class BuyLinkEntity {
  String name;
  String url;
  get getName => name;

  set setName(name) => this.name = name;

  get getUrl => url;

  set setUrl(url) => this.url = url;

  BuyLinkEntity({
    required this.name,
    required this.url,
  });
}
