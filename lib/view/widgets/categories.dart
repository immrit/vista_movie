import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vista_movie/pocketBase/remote_Service.dart';

import '../../Models/DataModel.dart';

class Categories extends StatefulWidget {
  Categories({
    super.key,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var jsonList;

  @override
  void initState() {
    super.initState();
    getData_Cat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 80,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: jsonList == null ? 0 : jsonList.length,
            reverse: true,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    width: 150,
                    height: 80,
                    margin: EdgeInsets.only(
                        right: index == 0 ? 28 : 10,
                        left: 5,
                        top: 5,
                        bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://vista.chbk.run/api/files/${jsonList[index]['collectionId']}/${jsonList[index]['id']}/${jsonList[index]['logo']}'))),
                  ),
                  Container(
                    width: 150,
                    height: 80,
                    margin: EdgeInsets.only(
                        right: index == 0 ? 28 : 10,
                        left: 5,
                        top: 5,
                        bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                      width: 150,
                      height: 80,
                      margin: EdgeInsets.only(
                          right: index == 0 ? 28 : 10,
                          left: 5,
                          top: 5,
                          bottom: 5),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        jsonList[index]['name'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              );
            }));
  }

  getData_Cat() async {
    try {
      Map<String, dynamic> q = {'sort': '-updated'};
      var response = await Dio().get(
          'https://vista.chbk.run/api/collections/categories/records',
          queryParameters: q);
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['items'] as List;
          print(response);
        });
      }
      return response.data['items']
          .map<DataModel>((e) => DataModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
