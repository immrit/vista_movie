import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:vista_movie/Di/di.dart';
import 'package:vista_movie/Models/DataModel.dart';

import 'detailScreen.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});
  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  late final jsonList;
  bool fetchedData = false;
  bool isDataFetched = false;

  late List<DataModel> movies = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    if (movies.isEmpty) {
      List<DataModel> fetchedData = await fetchMovies();
      if (mounted) {
        setState(() {
          movies = fetchedData;
          isDataFetched = true;
        });
      }
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
            child: FutureBuilder(
                future: Future.value(isDataFetched ? movies : null),
                builder: (contex, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 5,
                          mainAxisExtent: hi * .25),
                      shrinkWrap: true,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                image:
                                    'http://10.0.2.2:8089/api/files/${movies[index].collectionId}/${movies[index].id}/${movies[index].logo}',
                                name: movies[index].name,
                                url: movies[index].url,
                                subtitleUrl: movies[index].subTitle,
                                genre: movies[index].genre,
                              ),
                            ));
                          },
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
                                              'http://10.0.2.2:8089/api/files/${movies[index].collectionId}/${movies[index].id}/${movies[index].logo}'),
                                          fit: BoxFit.cover)),
                                ),
                                Text(
                                  "${movies[index].name}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('خطای غیر منتظره رخ داد'));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }

  void some() async {
    try {
      print(
          "===================================================================================");
      final pb = PocketBase('http://10.0.2.2:8089');
      final resultList =
          await pb.collection('Series').getFullList(filter: 'gener ~ "action"');
      if (!resultList.isNull) {
        print("!!! DATA FETCHED !!! =++      ${resultList}");
        print(
            "===================================================================================");
      }
    } catch (e) {
      print(e);
      print(
          "===================================================================================");
    }
  }

  Future<List<DataModel>> fetchMovies() async {
    while (true) {
      await Future.delayed(Duration(seconds: 3));
      try {
        BaseOptions options = new BaseOptions(
            connectTimeout: Duration(milliseconds: 20000),
            receiveTimeout: Duration(milliseconds: 20000));
        Dio dio = Dio();
        // dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: false, requestHeader: true));
        final response = await dio.get(
          'http://10.0.2.2:8089/api/collections/Movies/records',
          queryParameters: {
            'sort': '-updated',
            'expand': 'genre',
          },
        );
        if (response.statusCode == 200) {
          List<dynamic> jsonItems = response.data['items'] as List;
          List<DataModel> dataList =
              jsonItems.map((item) => DataModel.fromMapJson(item)).toList();
          return dataList;
        }
      } catch (e) {
        print(e);
      }
      return [];
    }
  }

  // Future<DataModel> fetchMovies() async {
  //   Map<String, dynamic> q = {'sort': '-updated'};

  //   final Dio dio = Dio();
  //   final response = await dio.get(
  //       'http://10.0.2.2:8089/api/collections/Movies/records',
  //       queryParameters: q);

  //   if (response.statusCode == 200) {
  //     return DataModel.fromMapJson(response.data);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // Future<void> fetchMovies() async {
  //   while (!fetchedData) {
  //     await Future.delayed(Duration(seconds: 3));
  //     try {
  //       print("fetching movies data!!!");
  //       Map<String, dynamic> q = {'sort': '-updated'};
  //       BaseOptions options = new BaseOptions(
  //           connectTimeout: Duration(milliseconds: 5000),
  //           receiveTimeout: Duration(milliseconds: 5000));
  //       Dio dio = new Dio(options);
  //       var response = await dio.get(
  //           'http://10.0.2.2:8089/api/collections/Movies/records',
  //           queryParameters: q);
  //       if (response.statusCode == 200) {
  //         // print("movie data fetched! ${response.data['items']}" );
  //         if (mounted) {
  //           setState(() {
  //             fetchedData = true;
  //             jsonList = response.data['items'] as List;
  //           });
  //         }
  //         break;
  //       }
  //       continue;
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }
}
