import 'dart:math';
import 'package:external_video_player_launcher/external_video_player_launcher.dart';
import 'package:flutter/material.dart';
import 'VideoPlayer.dart';

class DetailScreen extends StatelessWidget {
  String image;
  String name;
  String url;
  String subtitleUrl;
  String cats;
  DetailScreen(
      {Key? key,
      required this.image,
      required this.name,
      required this.url,
      required this.subtitleUrl,
      required this.cats})
      : super(key: key);
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
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Text("cats"),
          ])),
    );
  }
}
