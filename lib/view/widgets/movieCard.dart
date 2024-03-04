

import 'package:vista_movie/Models/DataModel.dart';
import 'package:flutter/material.dart';
class MovieCard extends StatelessWidget {

  const MovieCard({super.key,required this.movieDetail, required this.wi,required this.hi});
  final wi;
  final hi;
  final DataModel movieDetail;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        print("pressed");

      },
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: this.wi * .32,
                  height: this.hi * .23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://vista.chbk.run/api/files/${movieDetail.collectionId}/${movieDetail.id}/${movieDetail.logo}'
                        ),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
                    ),
                    child: Text(
                      'IMDb ', // Assuming `score` is the attribute containing the movie score
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              width: this.wi * .3,
              child: Text(
                movieDetail.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
