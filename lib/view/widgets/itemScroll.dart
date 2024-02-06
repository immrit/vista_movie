import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:vista_movie/Di/fetchData.dart';
import 'package:vista_movie/view/Screens/detail_Screen.dart';
import '../../Di/di.dart';
import '../../Models/DataModel.dart';

class Genre extends StatefulWidget {
  const Genre({
    super.key,
    required this.wi,
    required this.hi,
    required this.genreName,
    required this.collectionName,
  });
  final double wi;
  final double hi;
  final String genreName;
  final String collectionName;
  @override
  State<Genre> createState() => _GenreState();
}
class _GenreState extends State<Genre> {
  late List<dynamic> genreData = [];
  late DataFetcher dataFetcher;
  bool isConnected = false;
  bool  isDataFetched = false;
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
    fetchData();
  }
  void fetchData() async {

      DataFetcher dataFetcher = DataFetcher(
        cName: widget.collectionName,
        gName: widget.genreName,
      );
      switch (widget.collectionName) {
        case 'movies':
          switch (widget.genreName) {
            case 'drama':
              if (DataFetcher.moviesGenerDrama.isNotEmpty) {
                setState(() {
                  genreData = DataFetcher.moviesGenerDrama;
                  isDataFetched = true;
                });
                return;
              }
              break;
            case 'action':
              if (DataFetcher.moviesGenerAction.isNotEmpty) {
                setState(() {
                  genreData = DataFetcher.moviesGenerAction;
                  isDataFetched = true;
                });
                return;
              }
              break;
            case 'fantesy':
              if (DataFetcher.moviesGenerFantasy.isNotEmpty) {
                setState(() {
                  genreData = DataFetcher.moviesGenerFantasy;
                  isDataFetched = true;
                });
                return;
              }
              break;
          }
          break;
        case 'series':
          switch (widget.genreName) {
            case 'drama':
              if (DataFetcher.seriesGenerDrama.isNotEmpty) {
                setState(() {
                  genreData = DataFetcher.seriesGenerDrama;
                  isDataFetched = true;
                });
                return;
              }
              break;
            case 'action':
              if (DataFetcher.seriesGenerAction.isNotEmpty) {
                setState(() {
                  genreData = DataFetcher.seriesGenerAction;
                  isDataFetched = true;
                });
                return;
              }
              break;
            case 'fantasy':
              if (DataFetcher.seriesGenerFantasy.isNotEmpty) {
                setState(() {
                  genreData = DataFetcher.seriesGenerFantasy;
                  isDataFetched = true;
                });
                return;
              }
              break;
          }
          break;
      }
      if (genreData.isEmpty) {
        List<dynamic> fetchedData = await dataFetcher.fetchGener();
        setState(() {
          genreData = fetchedData;
          isDataFetched = true;
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.hi * .28,
      child: FutureBuilder(
        future: Future.value(isDataFetched ? genreData : null),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: genreData == null ? 0 : genreData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        image:
                            'https://vista.chbk.run/api/files/${genreData[index]['collectionId']}/${genreData[index]['id']}/${genreData[index]['logo']}',
                        name: genreData[index]['name'],
                        url: genreData[index]['url'],
                        subtitleUrl: genreData[index]['subtitle'],
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
                                      'https://vista.chbk.run/api/files/${genreData[index]['collectionId']}/${genreData[index]['id']}/${genreData[index]['logo']}'),
                                  fit: BoxFit.cover)),
                        ),
                        Text(
                          genreData[index]['name'],
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
  }
