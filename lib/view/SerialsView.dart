import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vista_movie/view/HomePage.dart';

import '../Models/DataModel.dart';
import 'widgets/detail_Screen.dart';

class SerialView extends StatefulWidget {
  const SerialView({super.key});

  @override
  State<SerialView> createState() => _SerialViewState();
}

class _SerialViewState extends State<SerialView> {
  var jsonList;

  @override
  void initState() {
    super.initState();
    getData_Serials();
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
            future: getData_Serials(),
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
                          ),
                        ));
                      },
                      child: Expanded(
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

  getData_Serials() async {
    try {
      Map<String, dynamic> q = {'sort': '-updated'};
      var response = await Dio().get(
          'https://vista.chbk.run/api/collections/Serials/records',
          queryParameters: q);
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['items'] as List;
          print(response);
        });
      }
      return response.data['items']
          .map<DataModel>((e) => DataModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
