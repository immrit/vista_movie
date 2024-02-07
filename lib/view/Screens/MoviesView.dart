import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vista_movie/Di/di.dart';
import 'package:vista_movie/util/api_exeption.dart';

import '../../Models/DataModel.dart';
import '../widgets/widgets.dart';
import 'detail_Screen.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});
  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  var jsonList;
  bool fetchedData = false;

  @override
  void initState() {
    super.initState();
    if (!fetchedData) {
      fetchMovies();
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
        body: itemsView(hi: hi, jsonList: jsonList, wi: wi));
  }

  Future<List<DataModel>> fetchMovies() async {
    final Dio _dio = locator.get();
    Map<String, dynamic> q = {'sort': '-updated', 'expand': 'cats'};

    try {
      print("fetching movies data!!!");

      var response =
          await _dio.get('collections/movies/records', queryParameters: q);
      return jsonList = response.data['items']
          .map<DataModel>((json) => DataModel.fromMapJson(json))
          .toList();
    } on DioException catch (ex) {
      throw ApiExeption(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiExeption(0, 'unknown Error');
    }
  }
}
