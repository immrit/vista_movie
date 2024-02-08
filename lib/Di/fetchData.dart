  import 'dart:convert';
  import 'package:dio/dio.dart';
  class DataFetcher {
    final String cName;

    final String gName;

    late final String url;
    BaseOptions options = new BaseOptions(
        connectTimeout: Duration(milliseconds: 8000),
        receiveTimeout: Duration(milliseconds: 8000)
    );
    final List<String> categoryUrls = [
      'https://vista.chbk.run/api/collections/Movies/records',
      'https://vista.chbk.run/api/collections/Serials/records',
      'https://vista.chbk.run/api/collections/Slider/records',
      'https://vista.chbk.run/api/collections/categories/records',
    ];
    // List<Map<String, dynamic>> moviesDataList = [];
    // List<Map<String, dynamic>> seriesDataList = [];
    // List<Map<String, dynamic>> slidersDataList = [];
    // List<Map<String, dynamic>> categoriesDataList = [];
    static List<Map<String, dynamic>> seriesGenerAction = [];
    static List<Map<String, dynamic>> seriesGenerDrama = [];
    static List<Map<String, dynamic>> seriesGenerFantasy = [];
    static List<Map<String, dynamic>> moviesGenerAction = [];
    static List<Map<String, dynamic>> moviesGenerDrama = [];
    static List<Map<String, dynamic>> moviesGenerFantasy = [];
    DataFetcher({
      required this.cName,
      required this.gName,
    }) {
      url = 'https://vista.chbk.run/api/collections/$cName/records';
    }
    Future<List<dynamic>> fetchGener() async {
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
          queryParameters: {'filter': 'gener ~ "$gName"'},
        );
        if (response.statusCode == 200) {
          List<dynamic> data = response.data['items'] as List;
          saveGenerData(data);
          return data;
        }
      } catch (e) {
        print(e);
      }
    }
      return [];
    }
    saveGenerData(List<dynamic> data) async {
      if (cName == 'series') {
        switch (gName) {
          case 'drama':
            seriesGenerDrama = List<Map<String, dynamic>>.from(data);
            break;
          case 'action':
            seriesGenerAction = List<Map<String, dynamic>>.from(data);
            break;
          case 'fantasy':
            seriesGenerFantasy = List<Map<String, dynamic>>.from(data);
            break;
        }
      } else if (cName == 'movies') {
        switch (gName) {
          case 'drama':
            moviesGenerDrama = List<Map<String, dynamic>>.from(data);
            break;
          case 'action':
            moviesGenerAction = List<Map<String, dynamic>>.from(data);
            break;
          case 'fantasy':
            moviesGenerFantasy = List<Map<String, dynamic>>.from(data);
            break;
        }
      }
    }
  }
