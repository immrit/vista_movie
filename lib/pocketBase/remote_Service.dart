// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:pocketbase/pocketbase.dart';

// import '../Models/sliderMD.dart';

// class RemoteService {
//   var jsonList;

//   sliderData() async {
//     try {
//       Map<String, dynamic> q = {'sort': '-update'};
//       var response = await Dio().get(
//           'https://pocketbase-mhl4ex.chbk.run/api/collections/Slider/records',
//           queryParameters: q);
//       if (response.statusCode == 200) {
//         jsonList = response.data['items'] as List;
//         if (kDebugMode) {
//           print(response);
//         }
//       }
//       return response.data['items']
//           .map<SliderModel>((e) => SliderModel.fromJson(e))
//           .toList();
//     } catch (e) {
//       print(e);
//     }
//   }
// }

import 'package:pocketbase/pocketbase.dart';
import 'package:vista_movie/Models/DataModel.dart';

class PB_Slider {
  Future<List<RecordModel>?>? getPosts() async {
    final pb = PocketBase('https://vista.chbk.run');

    final records = await pb.collection('Slider').getFullList(
          sort: '-created',
        );
    print(records);
    return records;
  }
}

class PB_Categories {
  Future<List<RecordModel>?>? getPosts_cats() async {
    final pb = PocketBase('https://vista.chbk.run');

    final records = await pb.collection('categories').getFullList(
          sort: '-created',
        );
    print(records);
    return records;
  }
}

class PB_Movies {
  Future<List<DataModel>?>? getPosts_movies() async {
    final pb = PocketBase('https://vista.chbk.run');

    final records = await pb.collection('Movies').getFullList(
          sort: '-created',
        );
    print(records);
  }
}

class PB_Serials {
  Future<List<DataModel>?>? getPosts_serials() async {
    final pb = PocketBase('https://vista.chbk.run');

    final records = await pb.collection('Serials').getFullList(
          sort: '-created',
        );
    print(records);
  }
}
