import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vista_movie/view/Screens/HomePage.dart';

import '../../Models/DataModel.dart';
import 'detail_Screen.dart';

class SerialView extends StatefulWidget {
  const SerialView({super.key});

  @override
  State<SerialView> createState() => _SerialViewState();
}

class _SerialViewState extends State<SerialView> {
  var jsonList;
  bool fetchedData = false;


  @override
  void initState() {
    super.initState();
    if (!fetchedData) {
      fetchSeries();
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
            title: Text("سریال ها", style: TextStyle(color: Colors.white)),
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(.1)),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: hi * .05),
          child: FutureBuilder(
            future: Future.value(fetchedData ? jsonList : null),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 5,
                      mainAxisExtent: hi * .25),
                  shrinkWrap: true,
                  itemCount: jsonList == null ? 0 : jsonList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            image:
                                'https://vista.chbk.run/api/files/${jsonList[index]['collectionId']}/${jsonList[index]['id']}/${jsonList[index]['logo']}',
                            name: jsonList[index]['name'],
                            url: jsonList[index]['url'],
                            subtitleUrl: jsonList[index]['subtitle'],

                          ),
                        ));
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: wi * .3,
                              height: hi * .2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://vista.chbk.run/api/files/${jsonList[index]['collectionId']}/${jsonList[index]['id']}/${jsonList[index]['logo']}'),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              jsonList[index]['name'],
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
        ));
  }

  Future<void> fetchSeries() async {
    while (!fetchedData){
      await Future.delayed(Duration(seconds: 3));
      try {
        print("fetching series data!!!");
        Map<String, dynamic> q = {'sort': '-updated'};
        BaseOptions options = new BaseOptions(
            connectTimeout: Duration(milliseconds: 5000),
            receiveTimeout: Duration(milliseconds: 5000)
        );
        Dio dio = new Dio(options);
        var response = await dio.get(
            'https://vista.chbk.run/api/collections/Serials/records',
            queryParameters: q);
        if (response.statusCode == 200) {
          print("series data fetched!");
          if (mounted) {
            setState(() {
              fetchedData = true;
              jsonList = response.data['items'] as List;
            });
          }
          break;
        }
        continue;
      }
      catch (e) {
        print(e);
      }
    }
  }
}
