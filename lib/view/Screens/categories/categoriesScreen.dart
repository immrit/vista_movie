import 'package:flutter/material.dart';

import 'genreScreen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}


class _CategoriesScreenState extends State<CategoriesScreen>  with TickerProviderStateMixin {
  @override
  late TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }
  @override

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var wi = MediaQuery.of(context).size.width;
    var hi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
          centerTitle: true,
          title: Text("دسته بندی ها", style: TextStyle(color: Colors.white)),
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(.1),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "ژانر فیلم ها",
            ),
            Tab(
              text: "ژانر سریال ها"),

            Tab(
              text: "ژانر",
            ),
            Tab(
              text: "ژانر",
            ),
            Tab(
              text: "ژانر",
            ),


          ],
          labelStyle: TextStyle(fontSize: wi * .035,),
          labelPadding: EdgeInsets.symmetric(horizontal: 0),

        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          GenreScreen(collectionName: 'moviesGenre',type: 'movies',),
          GenreScreen(collectionName: 'seriesGenre',type: 'series',),
          Center(),
          Center(
            child: Text("Some"),
          ),
          Center(
            child: Text("Some"),
          ),

        ],
      ),
    );
  }
}



