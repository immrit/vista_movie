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
import 'dart:convert';

class DataModel {
  final String id;
  final String name;
  final String logo;
  final String collectionId;
  final String url;
  final String subTitle;
  final List<String> genre;
  DataModel(this.id,this.name,this.logo,this.collectionId,this.url,this.subTitle,this.genre);
  factory DataModel.fromMapJson(Map<String,dynamic> jsonObject){
    List<String> genre = [];
    if (jsonObject['expand'] != null && jsonObject['expand']['genre'] != null) {
      jsonObject['expand']['genre'].forEach((genreItem) {
        genre.add(genreItem['genre']);
      });
    }
    return DataModel(
      jsonObject['id'],
      jsonObject['name'],
      jsonObject['logo'],
      jsonObject['collectionId'],
      jsonObject['url'],
      jsonObject['subtitle'],
      genre
    );
  }

}
