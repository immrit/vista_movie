import 'package:flutter/material.dart';
import 'package:vista_movie/view/widgets/detail_Screen.dart';

import '../../pocketBase/remote_Service.dart';

class NewMovies extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: hi * .28,
      child: FutureBuilder(
        future: myMovies.getPosts_movies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        image:
                            'https://vista.chbk.run/api/files/${snapshot.data![index].collectionId}/${snapshot.data![index].id}/${snapshot.data![index].logo}', name: snapshot.data![index].name,
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
                            width: wi * .3,
                            height: hi * .23,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://vista.chbk.run/api/files/${snapshot.data![index].collectionId}/${snapshot.data![index].id}/${snapshot.data![index].logo}'),
                                    fit: BoxFit.cover)),
                          ),
                          Text(
                            snapshot.data![index].name,
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
}

class NewSerials extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: hi * .28,
      child: FutureBuilder(
        future: mySerials.getPosts_serials(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right: index == 0 ? 28 : 10,
                        left: 5,
                        top: 5,
                        bottom: 5),
                    child: Column(
                      children: [
                        Container(
                          width: wi * .3,
                          height: hi * .23,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://vista.chbk.run/api/files/${snapshot.data![index].collectionId}/${snapshot.data![index].id}/${snapshot.data![index].logo}'),
                                  fit: BoxFit.cover)),
                        ),
                        Text(
                          snapshot.data![index].name,
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
    );
  }
}
