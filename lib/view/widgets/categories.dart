import 'package:flutter/material.dart';
import 'package:vista_movie/pocketBase/remote_Service.dart';

class Categories extends StatelessWidget {
  Categories({
    super.key,
    required this.myCategories,
  });

  final PB_Categories myCategories;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: FutureBuilder(
          future: myCategories.getPosts_cats(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          width: 150,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://vista.chbk.run/api/files/${snapshot.data![index].collectionId}/${snapshot.data![index].id}/${snapshot.data![index].logo}'))),
                          margin: EdgeInsets.only(
                              right: index == 0 ? 28 : 10,
                              left: 5,
                              top: 5,
                              bottom: 5),
                        ),
                        Container(
                          width: 150,
                          height: 80,
                          margin: EdgeInsets.only(
                              right: index == 0 ? 28 : 10,
                              left: 5,
                              top: 5,
                              bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(
                            width: 150,
                            height: 80,
                            margin: EdgeInsets.only(
                                right: index == 0 ? 28 : 10,
                                left: 5,
                                top: 5,
                                bottom: 5),
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              snapshot.data![index].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
