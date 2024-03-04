import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:vista_movie/Di/fetchData.dart';
import 'package:vista_movie/view/Screens/detailScreen.dart';
import 'package:vista_movie/view/widgets/movieCard.dart';

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
      cName: widget.type,
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
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.grey,
        body:GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,

          mainAxisExtent: hi * .26),
      shrinkWrap: true,

      itemCount: MoviesData.length,
      itemBuilder: (context, index) {
        return MovieCard(movieDetail: MoviesData[index], wi: wi, hi: hi);
          },
        ));
  }
}
