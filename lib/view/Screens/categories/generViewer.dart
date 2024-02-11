import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:vista_movie/Di/fetchData.dart';
import 'package:vista_movie/view/Screens/detail_Screen.dart';

import '../../../Models/DataModel.dart';
class GenerViewer extends StatefulWidget {
  const GenerViewer({
    super.key,
    required this.genreName,
    required this.collectionName,
    required this.type
  });
  final String type;
  final String genreName;
  final String collectionName;

  @override
  State<GenerViewer> createState() => _GenerViewerState();
}
class _GenerViewerState extends State<GenerViewer> {
  late List<DataModel> genreData = [];
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
      List<DataModel> fetchedData = await dataFetcher.fetchGener();
      if (mounted) {
        setState(() {
          genreData = fetchedData;
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
          itemCount: genreData == null ? 0 : genreData.length,
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
                                'https://vista.chbk.run/api/files/${genreData[index].collectionId}/${genreData[index].id}/${genreData[index].logo}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(top: hi * 0.06,
                          child: Center(
                            child: Text(
                              genreData[index].id,
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
