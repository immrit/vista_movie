import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';
import 'package:vista_movie/view/Movies.dart';
import '../pocketBase/remote_Service.dart';
import 'widgets/categories.dart';
import 'widgets/itemsScroll.dart';
import 'widgets/slider.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PB_Slider myPocketBase = PB_Slider();
  PB_Categories myCategories = PB_Categories();
  PB_Movies myMovies = PB_Movies();
  PB_Serials mySerials = PB_Serials();
  int curenpageIndex = 1;
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    myMovies.getPosts_movies();
    mySerials.getPosts_serials();
  }

  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var hi = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: Hidable(
        //   controller: scrollController,
        //   enableOpacityAnimation: true,
        //   preferredWidgetSize: Size.fromHeight(hi * .09),
        //   child: BottomNavigationBar(
        //     items: const <BottomNavigationBarItem>[
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.home),
        //         label: 'خانه',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.movie),
        //         label: 'فیلم ها',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.movie_filter_sharp),
        //         label: 'سریال ها',
        //       ),
        //     ],
        //     currentIndex: curenpageIndex,
        //     selectedItemColor: Colors.amber[800],
        //     onTap: _onItemTapped,
        //   ),
        // ),
        appBar: AppBar(
            backgroundColor: Colors.black87,
            elevation: 5,
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
                  SliderClass(myPocketBase: myPocketBase),
                  SizedBox(height: 25),
                  //Category
                  Categories(
                    myCategories: myCategories,
                  ),
                  //seeMore Movie
                  seeMore(name: 'جدیدترین فیلم ها'),
                  //Movies
                  NewMovies(myMovies: myMovies, wi: wi, hi: hi),
                  //seeMore Serials
                  seeMore(name: 'جدیدترین سریال ها'),
                  //Serials

                  NewSerials(
                    mySerials: mySerials,
                    wi: wi,
                    hi: hi,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
