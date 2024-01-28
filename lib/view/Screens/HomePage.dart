import 'package:flutter/material.dart';

import '../../pocketBase/remote_Service.dart';
import '../widgets/categories.dart';
import '../widgets/itemsScroll.dart';
import '../widgets/slider.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curenpageIndex = 1;
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var hi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(.9),
          elevation: 0,
          title: const Text(
            "Vista Movie",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ))
          ]),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black87,
        child: ListView(
          controller: scrollController,
          children: [
            Column(
              children: [
                //Slider
                SizedBox(height: 25),
                SliderClass(),
                SizedBox(height: 25),
                //Category
                Categories(),
                //seeMore Movie
                seeMore(name: 'جدیدترین فیلم ها'),
                //Movies
                NewMovies(wi: wi, hi: hi),
                //seeMore Serials
                seeMore(name: 'جدیدترین سریال ها'),
                //Serials
                NewSerials(
                  wi: wi,
                  hi: hi,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}