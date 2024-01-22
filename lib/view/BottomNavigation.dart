import 'package:flutter/material.dart';
import 'package:vista_movie/view/HomePage.dart';
import 'package:vista_movie/view/MoviesView.dart';
import 'package:vista_movie/view/SerchView.dart';
import 'package:vista_movie/view/SerialsView.dart';
import 'package:vista_movie/view/profileView.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeBottomNavigation(),
    );
  }
}

class HomeBottomNavigation extends StatefulWidget {
  const HomeBottomNavigation({super.key});

  @override
  State<HomeBottomNavigation> createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MoviesView(),
    SerialView(),
    SearchView(),
    ProfileView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ویترین',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'فیلم ها',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter_sharp),
              label: 'سریال ها',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'جستجو',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'پروفایل',
            ),
          ],
          backgroundColor: Colors.black.withOpacity(.8),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}