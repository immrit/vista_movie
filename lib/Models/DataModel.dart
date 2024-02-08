class DataModel {
  String id;
  String name;
  String logo;
  String collectionId;
  String url;
  String expand_cats;

  DataModel(
      {required this.id,
      required this.name,
      required this.logo,
      required this.collectionId,
      required this.url,
      required this.expand_cats});

  factory DataModel.fromMapJson(Map<String, dynamic> json) {
    return DataModel(
        id: json['id'],
        name: json['name'],
        logo: json['logo'],
        collectionId: json['collectionId'],
        url: json['url'],
        expand_cats: json['expand']['cats']['name']);
  }
}
