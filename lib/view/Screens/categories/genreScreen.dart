import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:vista_movie/view/Screens/categories/genreViewer.dart';
class GenreScreen extends StatefulWidget {
  const GenreScreen({Key? key,required this.collectionName,required this.type}) : super(key: key);
  final String collectionName;
  final String type;
  @override
  State<GenreScreen> createState() => GenreScreenState();
}
class GenreScreenState extends State<GenreScreen> {
  var jsonList;
  bool fetchedData = false;
  late final String genreName;
  @override
  void initState() {
    super.initState();
    if (!fetchedData) {
      fetchMovies();
    }
  }

  Future<void> fetchMovies() async {
    while (!fetchedData) {
      await Future.delayed(Duration(seconds: 3));
      try {
        Map<String, dynamic> q = {'sort': '-updated'};
        BaseOptions options = new BaseOptions(
            connectTimeout: Duration(milliseconds: 5000),
            receiveTimeout: Duration(milliseconds: 5000));
        Dio dio = new Dio(options);
        var response = await dio.get(
            'https://vista.chbk.run/api/collections/${widget.collectionName}/records',
            queryParameters: q);
        if (response.statusCode == 200) {
          if (mounted) {
            setState(() {
              fetchedData = true;
              jsonList = response.data['items'] as List;
            });
          }
          break;
        }
        continue;
      } catch (e) {
        print(e);
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
          itemCount: jsonList == null ? 0 : jsonList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
        Navigator.of(context).push(MaterialPageRoute(

        builder: (context) =>
            GenreViewer(collectionName:widget.collectionName , genreName:jsonList[index]['genre'],type: widget.type,)));
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
                                'https://vista.chbk.run/api/files/${jsonList[index]['collectionId']}/${jsonList[index]['id']}/${jsonList[index]['cover']}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned.fill(top: hi * 0.06,
                          child: Center(
                            child: Text(
                              jsonList[index]['genre'],
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
