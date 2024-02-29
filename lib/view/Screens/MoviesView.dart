import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:vista_movie/view/Screens/HomePage.dart';

import '../../Models/DataModel.dart';
import 'detailScreen.dart';
class MoviesView extends StatefulWidget {
  const MoviesView({super.key});
  @override
  State<MoviesView> createState() => _MoviesViewState();
}
class _MoviesViewState extends State<MoviesView> {
  late final  jsonList;
  bool fetchedData = false;
  @override
  void initState() {
    super.initState();
    if (!fetchedData) {
      fetchMovies();
    }
  }
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var hi = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
            centerTitle: true,
            title: Text("فیلم ها", style: TextStyle(color: Colors.white)),
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(.1)),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(top: hi * .03),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 5,
                  mainAxisExtent: hi * .25),
              shrinkWrap: true,
              itemCount: jsonList == null ? 0 : jsonList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                   onTap:
                   some

                  // () {
                  //
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => DetailScreen(
                  //       image:
                  //           'https://vista.chbk.run/api/files/${jsonList[index]['collectionId']}/${jsonList[index]['id']}/${jsonList[index]['logo']}',
                  //       name: jsonList[index]['name'],
                  //       url: jsonList[index]['url'],
                  //       subtitleUrl: jsonList[index]['subtitle'],
                  //
                  //     ),
                  //   ));
                  // }
                   ,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: wi * .3,
                          height: hi * .2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://vista.chbk.run/api/files/${jsonList[index]['collectionId']}/${jsonList[index]['id']}/${jsonList[index]['logo']}'),
                                  fit: BoxFit.cover)),
                        ),
                        Text(
                          jsonList[index]['name'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ),
                );
              },
            )));
  }
  void some()async {
      try {
        print("===================================================================================");
        final pb = PocketBase('https://vista.chbk.run');
          final resultList = await pb.collection('Series').getFullList(
              filter: 'gener ~ "action"'
          );
        if (!resultList.isNull) {
          print("!!! DATA FETCHED !!! =++      ${resultList}" );
          print("===================================================================================");
        }
      }
      catch (e) {
        print(e);
        print("===================================================================================");
      }
  }
  Future<void> fetchMovies() async {
    while (!fetchedData){
      await Future.delayed(Duration(seconds: 3));
      try {

        print("fetching movies data!!!");
        Map<String, dynamic> q = {'sort': '-updated'};
        BaseOptions options = new BaseOptions(
            connectTimeout: Duration(milliseconds: 5000),
            receiveTimeout: Duration(milliseconds: 5000)

        );
        Dio dio = new Dio(options);
        var response = await dio.get(
            'https://vista.chbk.run/api/collections/Movies/records',
            queryParameters: q);
        if (response.statusCode == 200) {
          // print("movie data fetched! ${response.data['items']}" );
          if (mounted) {
            setState(() {
              fetchedData = true;
              jsonList = response.data['items'] as List;
            });
          }
          break;
        }
        continue;
      }
      catch (e) {
        print(e);
      }
    }

  }
}
