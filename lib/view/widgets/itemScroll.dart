import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:vista_movie/Di/fetchData.dart';
import 'package:vista_movie/view/Screens/detailScreen.dart';
import '../../Di/di.dart';
import '../../Models/DataModel.dart';

class ItemScroll extends StatefulWidget {
  const   ItemScroll({
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
  State<ItemScroll> createState() => _genreState();
}
class _genreState extends State<ItemScroll> {
    late List<DataModel> movieDetail = [];
    late DataFetcher dataFetcher;
  bool isConnected = false;
  bool isDataFetched = false;
  @override
  void dispose() {
    super.dispose();
  }
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

    if (movieDetail.isEmpty) {
      List<DataModel> fetchedData = await dataFetcher.fetchGenre();
      if (mounted) {
        setState(() {
          movieDetail = fetchedData;
          isDataFetched = true;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.hi * .28,
      child: FutureBuilder(
        future: Future.value(isDataFetched ? movieDetail : null),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: movieDetail == null ? 0 : movieDetail.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    fetchData();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        image:
                        'https://vista.chbk.run/api/files/${movieDetail[index].collectionId}/${movieDetail[index].id}/${movieDetail[index].logo}',
                        name: movieDetail[index].name,
                        url: movieDetail[index].url,
                        subtitleUrl: movieDetail[index].subTitle, genre: movieDetail[index].genre
                        ,
                        // url: snapshot.data![index].url,
                      ),
                    ));
                  },
                  child: Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.only(
                        right: index == 0 ? 28 : 10,
                        left: 5,
                        top: 5,
                      bottom: 5
                        ),
                    child:Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: widget.wi * .3,
                              height: widget.hi * .23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://vista.chbk.run/api/files/${movieDetail[index].collectionId}/${movieDetail[index].id}/${movieDetail[index].logo}'
                                    ),
                                    fit: BoxFit.cover
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
                                ),
                                child: Text(
                                  'IMDb 201', // Assuming `score` is the attribute containing the movie score
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: widget.wi * .3,
                          child: Text(
                            movieDetail[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
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
