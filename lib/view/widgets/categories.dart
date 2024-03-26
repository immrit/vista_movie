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
  bool fetchedData = false;
  @override
  void initState() {
    super.initState();
    if (!fetchedData) {
      fetchCategories();
    }
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
                                'http://10.0.2.2:8089/api/files/${jsonList[index]['collectionId']}/${jsonList[index]['id']}/${jsonList[index]['logo']}'))),
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

  Future<void> fetchCategories() async {
    while (!fetchedData) {
      await Future.delayed(Duration(seconds: 3));
      try {
        print("fetching categories data!!!");
        Map<String, dynamic> q = {'sort': '-updated'};
        BaseOptions options = new BaseOptions(
            connectTimeout: Duration(milliseconds: 5000),
            receiveTimeout: Duration(milliseconds: 5000));
        Dio dio = new Dio(options);
        var response = await dio.get(
            'http://10.0.2.2:8089/api/collections/categories/records',
            queryParameters: q);
        if (response.statusCode == 200) {
          print("categories data fetched!");
          setState(() {
            fetchedData = true;
            jsonList = response.data['items'] as List;
          });
          break;
        }
        continue;
      } catch (e) {
        print(e);
      }
    }
  }
}
