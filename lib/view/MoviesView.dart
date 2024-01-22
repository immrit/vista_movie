import 'package:flutter/material.dart';
import 'package:vista_movie/view/HomePage.dart';

import 'widgets/detail_Screen.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: hi * .03),
          child: FutureBuilder(
            future: HomePage.myMovies.getPosts_movies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 5,
                      mainAxisExtent: hi * .25),
                  // reverse: true,
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,

                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            image:
                                'https://vista.chbk.run/api/files/${snapshot.data![index].collectionId}/${snapshot.data![index].id}/${snapshot.data![index].logo}',
                            name: snapshot.data![index].name,
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
        ));
  }
}
