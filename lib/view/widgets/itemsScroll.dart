import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vista_movie/view/Screens/detail_Screen.dart';
import '../../Di/di.dart';
import '../../Models/DataModel.dart';

class NewMovies extends StatefulWidget {
  const NewMovies({
    super.key,
    required this.wi,
    required this.hi,
  });

  final double wi;
  final double hi;

  @override
  State<NewMovies> createState() => _NewMoviesState();
}

class _NewMoviesState extends State<NewMovies> {
  var jsonList;
  bool isConnected = false;
  bool fetchedData = false;

  @override
  void initState() {
    super.initState();
    // Connectivity().checkConnectivity().then((result) {
    //   setState(() {
    //     isConnected = result != ConnectivityResult.none;
    //   });
    //   if (isConnected) {
    //     FetchMovies();
    //   }
    // });
    if (!fetchedData) {
      fetchMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.hi * .28,
      child: FutureBuilder(
        future: Future.value(fetchedData ? jsonList : null),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: jsonList == null ? 0 : jsonList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        image:
                            'https://vista.chbk.run/api/files/${jsonList[index]['collectionId']}/${jsonList[index]['id']}/${jsonList[index]['logo']}',
                        name: jsonList[index]['name'],
                        url: jsonList[index]['url'],
                        subtitleUrl: jsonList[index]['subtitle'],
                        // url: snapshot.data![index].url,
                      ),
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        right: index == 0 ? 28 : 10,
                        left: 5,
                        top: 5,
                        bottom: 5),
                    child: Column(
                      children: [
                        Container(
                          width: widget.wi * .3,
                          height: widget.hi * .23,
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
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> fetchMovies() async {
    while (!fetchedData) {
      await Future.delayed(Duration(seconds: 3));
      try {
        print("fetching movies data!!!");
        Map<String, dynamic> q = {'sort': '-updated'};
        BaseOptions options = new BaseOptions(
            connectTimeout: Duration(milliseconds: 5000),
            receiveTimeout: Duration(milliseconds: 5000));
        Dio dio = new Dio(options);
        var response = await dio.get(
            'https://vista.chbk.run/api/collections/Movies/records',
            queryParameters: q);
        if (response.statusCode == 200) {
          print("movie data fetched!");
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

class NewSerials extends StatefulWidget {
  NewSerials({
    Key? key,
    required this.wi,
    required this.hi,
  }) : super(key: key);

  final double wi;
  final double hi;

  @override
  State<NewSerials> createState() => _NewSerialsState();
}

class _NewSerialsState extends State<NewSerials> {
  var jsonList;
  bool fetchedData = false;

  @override
  void initState() {
    super.initState();
    if (!fetchedData) {
      fetchSeries();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.hi * .28,
      child: FutureBuilder(
        future: Future.value(fetchedData ? jsonList : null),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: jsonList == null ? 0 : jsonList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        image:
                            'https://vista.chbk.run/api/files/${jsonList[index]['collectionId']}/${jsonList[index]['id']}/${jsonList[index]['logo']}',
                        name: jsonList[index]['name'],
                        url: jsonList[index]['url'],
                        subtitleUrl: jsonList[index]['subtitle'],

                        // url: snapshot.data![index].url,
                      ),
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        right: index == 0 ? 28 : 10,
                        left: 5,
                        top: 5,
                        bottom: 5),
                    child: Column(
                      children: [
                        Container(
                          width: widget.wi * .3,
                          height: widget.hi * .23,
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
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> fetchSeries() async {
    while (!fetchedData) {
      await Future.delayed(Duration(seconds: 3));
      try {
        print("fetching series data!!!");
        Map<String, dynamic> q = {'sort': '-updated'};
        BaseOptions options = new BaseOptions(
            connectTimeout: Duration(milliseconds: 5000),
            receiveTimeout: Duration(milliseconds: 5000));
        // Dio dio = new Dio(options);
        final Dio _dio = locator.get();
        var response =
            await _dio.get('collections/Serials/records', queryParameters: q);
        if (response.statusCode == 200) {
          print("series data fetched!");
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
