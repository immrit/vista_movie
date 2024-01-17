import 'package:flutter/material.dart';
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

  // late final PB_Movies mymovies;
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
