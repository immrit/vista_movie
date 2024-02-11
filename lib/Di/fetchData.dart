  import 'dart:convert';
  import 'package:dio/dio.dart';
import 'package:vista_movie/Di/di.dart';

import '../Models/DataModel.dart';
  class DataFetcher {
    final String cName;
    final String gName;
    late final String url;
    BaseOptions options = new BaseOptions(
        connectTimeout: Duration(milliseconds: 8000),
        receiveTimeout: Duration(milliseconds: 8000)
    );
    // final List<String> categoryUrls = [
    //   'https://vista.chbk.run/api/collections/Movies/records',
    //   'https://vista.chbk.run/api/collections/Serials/records',
    //   'https://vista.chbk.run/api/collections/Slider/records',
    //   'https://vista.chbk.run/api/collections/categories/records',
    // ];
    // List<Map<String, dynamic>> moviesDataList = [];
    // List<Map<String, dynamic>> seriesDataList = [];
    // List<Map<String, dynamic>> slidersDataList = [];
    // List<Map<String, dynamic>> categoriesDataList = [];
    static List<DataModel> seriesGenerAction = [];
    static List<DataModel> seriesGenerDrama = [];
    static List<DataModel> seriesGenerFantasy = [];
    static List<DataModel> moviesGenerAction = [];
    static List<DataModel> moviesGenerDrama = [];
    static List<DataModel> moviesGenerFantasy = [];
    DataFetcher({
      required this.cName,
      required this.gName,
    }
    ) {
      url = 'https://vista.chbk.run/api/collections/$cName/records';
    }
    Future<List<DataModel>> fetchGener() async {
    while (true) {
      await Future.delayed(Duration(seconds: 3));
      try {
        BaseOptions options = new BaseOptions(
            connectTimeout: Duration(milliseconds: 8000),
            receiveTimeout: Duration(milliseconds: 8000)
        );
        Dio dio = new Dio(options);
        // dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: false, requestHeader: true));
        final response = await dio.get(
          url,
          queryParameters: {'expand': 'gener','filter': 'gener ~ "$gName"',},
        );
        if (response.statusCode == 200) {
          List<dynamic> jsonItems = response.data['items'] as  List ;
          List<DataModel> dataList = jsonItems.map((item) => DataModel.fromJson(item)).toList();
          saveGenerData(dataList);
          return dataList;
        }
      } catch (e) {
        print(e);
      }
      return [];
    }
    }
    saveGenerData(List<dynamic> data) async {
      if (cName == 'series') {
        switch (gName) {
          case 'drama':
            seriesGenerDrama = List<DataModel>.from(data);
            break;
          case 'action':
            seriesGenerAction = List<DataModel>.from(data);
            break;
          case 'fantasy':
            seriesGenerFantasy = List<DataModel>.from(data);
            break;
        }
      } else if (cName == 'movies') {
        switch (gName) {
          case 'drama':
            moviesGenerDrama = List<DataModel>.from(data);
            break;
          case 'action':
            moviesGenerAction = List<DataModel>.from(data);
            break;
          case 'fantasy':
            moviesGenerFantasy = List<DataModel>.from(data);
            break;
        }
      }
    }
  }
