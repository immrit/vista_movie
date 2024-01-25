import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vista_movie/view/widgets/detail_Screen.dart';

import '../../Models/DataModel.dart';
import '../../pocketBase/remote_Service.dart';

class NewMovies extends StatefulWidget {
  const NewMovies({
    super.key,
    required this.myMovies,
    required this.wi,
    required this.hi,
  });

  final PB_Movies myMovies;
  final double wi;
  final double hi;

  @override
  State<NewMovies> createState() => _NewMoviesState();
}

class _NewMoviesState extends State<NewMovies> {
  var jsonList;

  @override
  void initState() {
    super.initState();
    getData_itemScroll_Movies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.hi * .28,
      child: FutureBuilder(
        future: getData_itemScroll_Movies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
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
                        // url: snapshot.data![index].url,
                      ),
                    ));
                  },
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          right: index == 0 ? 28 : 10,
                          left: 5,
                          top: 5,
                          bottom: 5),
                      child: Column(
                        children: [
                          Container(
                            width: widget.wi * .3,
                            height: widget.hi * .23,
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
    );
  }

  getData_itemScroll_Movies() async {
    try {
      Map<String, dynamic> q = {'sort': '-updated'};
      var response = await Dio().get(
          'https://vista.chbk.run/api/collections/Movies/records',
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

class NewSerials extends StatefulWidget {
  NewSerials({
    Key? key,
    required this.mySerials,
    required this.wi,
    required this.hi,
  }) : super(key: key);

  final PB_Serials mySerials;
  final double wi;
  final double hi;

  @override
  State<NewSerials> createState() => _NewSerialsState();
}

class _NewSerialsState extends State<NewSerials> {
  var jsonList;

  @override
  void initState() {
    super.initState();
    getData_itemScroll_Serials();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.hi * .28,
      child: FutureBuilder(
        future: getData_itemScroll_Serials(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
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
                        // url: snapshot.data![index].url,
                      ),
                    ));
                  },
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          right: index == 0 ? 28 : 10,
                          left: 5,
                          top: 5,
                          bottom: 5),
                      child: Column(
                        children: [
                          Container(
                            width: widget.wi * .3,
                            height: widget.hi * .23,
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
    );
  }

  getData_itemScroll_Serials() async {
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
