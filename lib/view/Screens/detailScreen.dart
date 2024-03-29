import 'dart:math';
import 'package:external_video_player_launcher/external_video_player_launcher.dart';
import 'package:flutter/material.dart';
import 'VideoPlayer.dart';
class DetailScreen extends StatelessWidget {
  String image;
  String name;
  String url;
  String subtitleUrl;
  final List<String> genre;
  DetailScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.url,
    required this.subtitleUrl,
    required this.genre
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var hi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black87,
          child: Column(children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: hi * .5,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: hi * .3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover)),
                      ),
                      Container(
                          width: double.infinity,
                          height: hi * .3,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(.8),
                                    Colors.grey.withOpacity(.6)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)))),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: hi * .15, left: wi * .05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: wi * .4,
                        height: hi * .3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover)),
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.only(top: hi * .08, left: wi * .05),
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.white,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: wi * .113),
                        child: FloatingActionButton(
                          backgroundColor: Colors.amber,
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => VideoPlayerScreen(
                                videoUrl: url,
                                subtitleUrl: subtitleUrl,

                              ),
                            ));
                          },
                          child: const Icon(Icons.play_arrow),
                          
                          //   onPressed: () {
                          //     ExternalVideoPlayerLauncher.launchOtherPlayer(
                          //         url, MIME.applicationXMpegURL, {
                          //       "title": name,
                          //     });
                          //   },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: genre.map((genres) {
                return Text(
                  genres,
                  style: TextStyle(fontSize: 20,color: Colors.white),
                );
              }).toList(),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: genre.length,
              itemBuilder: (context, index) {
                return Text(
                  genre[index],
                  style: TextStyle(fontSize: 16,color: Colors.white),
                );
              },
            ),
        ])),
    );
  }
}
