import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../pocketBase/remote_Service.dart';

class SliderClass extends StatelessWidget {
  SliderClass({
    super.key,
    required this.myPocketBase,
  });

  final PB_Slider myPocketBase;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(viewportFraction: 0.88, keepPage: true);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 200,
          child: FutureBuilder<List<RecordModel>?>(
            future: myPocketBase.getPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PageView.builder(
                    reverse: true,
                    controller: controller,
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 200,
                            color: Colors.white60,
                            child: Stack(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Image.network(
                                    'https://vista.chbk.run/api/files/${snapshot.data![index].collectionId}/${snapshot.data![index].id}/${snapshot.data![index].logo}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  padding:
                                      EdgeInsets.only(right: 20, bottom: 20),
                                  child: Text(
                                    snapshot.data![index].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.4),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return Center(child: CarouselLoading());
              }
            },
          ),
        ),
        //indicator
        Positioned(
          bottom: 8,
          child: SmoothPageIndicator(
            controller: controller, // PageController
            count: 5,
            effect: JumpingDotEffect(
                dotHeight: 8, dotWidth: 8), // your preferred effect
          ),
        )
      ],
    );
  }
}

class CarouselLoading extends StatelessWidget {
  CarouselLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey.shade300,
      child: SizedBox(
        height: 200,
        child: Container(
          margin: EdgeInsets.only(left: 35, right: 35),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 200,
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
