import 'package:dio/dio.dart';
import '../Models/DataModel.dart';

class DataFetcher {
  final String cName;
  final String gName;
  late final String url;
  BaseOptions options = new BaseOptions(
      connectTimeout: Duration(milliseconds: 20000),
      receiveTimeout: Duration(milliseconds: 20000));

  DataFetcher({
    required this.cName,
    required this.gName,
  }) {
    url = 'http://10.0.2.2:8089/api/collections/$cName/records';
  }
  Future<List<DataModel>> fetchGenre() async {
    while (true) {
      await Future.delayed(Duration(seconds: 3));
      try {
        BaseOptions options = new BaseOptions(
            connectTimeout: Duration(milliseconds: 20000),
            receiveTimeout: Duration(milliseconds: 20000));
        Dio dio = new Dio(options);
        // dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: false, requestHeader: true));
        final response = await dio.get(
          url,
          queryParameters: {
            'expand': 'genre',
            'filter': 'genre ~ "$gName"',
          },
        );
        if (response.statusCode == 200) {
          List<dynamic> jsonItems = response.data['items'] as List;
          List<DataModel> dataList =
              jsonItems.map((item) => DataModel.fromMapJson(item)).toList();
          // saveGenerData(dataList);
          return dataList;
        }
      } catch (e) {
        print(e);
      }
      return [];
    }
  }
}
