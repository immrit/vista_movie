// class SliderModel {
//   String collectionId;
//   String collectionName;
//   DateTime created;
//   String id;
//   String name;
//   String pic;
//   DateTime updated;

//   SliderModel({
//     required this.collectionId,
//     required this.collectionName,
//     required this.created,
//     required this.id,
//     required this.name,
//     required this.pic,
//     required this.updated,
//   });

//   factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
//         collectionId: json["collectionId"],
//         collectionName: json["collectionName"],
//         created: DateTime.parse(json["created"]),
//         id: json["id"],
//         name: json["name"],
//         pic: json["pic"],
//         updated: DateTime.parse(json["updated"]),
//       );

//   // Map<String, dynamic> toJson() => {
//   //       "collectionId": collectionId,
//   //       "collectionName": collectionName,
//   //       "created": created.toIso8601String(),
//   //       "id": id,
//   //       "name": name,
//   //       "pic": pic,
//   //       "updated": updated.toIso8601String(),
//   //     };
// }

class DataModel {
  final String id;
  final String name;
  final String logo;
  final String collectionId;

  DataModel({
    required this.id,
    required this.name,
    required this.logo,
    required this.collectionId,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        id: json['id'],
        name: json['name'],
        logo: json['logo'],
        collectionId: json['collectionId']);
  }
}
