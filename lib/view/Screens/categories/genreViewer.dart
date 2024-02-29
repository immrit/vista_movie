import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:vista_movie/Di/fetchData.dart';
import 'package:vista_movie/view/Screens/detailScreen.dart';

import '../../../Models/DataModel.dart';
class GenreViewer extends StatefulWidget {
  const GenreViewer({
    super.key,
    required this.genreName,
    required this.collectionName,
    required this.type
  });
  final String type;
  final String genreName;
  final String collectionName;

  @override
  State<GenreViewer> createState() => _GenreViewerState();
}
class _GenreViewerState extends State<GenreViewer> {
  late List<DataModel> MoviesData = [];
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
  
    if (MoviesData.isEmpty) {
      List<DataModel> fetchedData = await dataFetcher.fetchGenre();
      if (mounted) {
        setState(() {
          MoviesData = fetchedData;
          isDataFetched = true;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var hi = MediaQuery.of(context).size.height;
    return  Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: hi * .03),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              mainAxisExtent: hi * .15),
          shrinkWrap: true,
          itemCount: MoviesData == null ? 0 : MoviesData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {

              },
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: wi * .45,
                          height: hi * .12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://vista.chbk.run/api/files/${MoviesData[index].collectionId}/${MoviesData[index].id}/${MoviesData[index].logo}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(top: hi * 0.06,
                          child: Center(
                            child: Text(
                              MoviesData[index].id,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
