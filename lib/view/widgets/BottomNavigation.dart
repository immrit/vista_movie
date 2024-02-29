import 'package:flutter/material.dart';
import 'package:vista_movie/view/Screens/HomePage.dart';
import 'package:vista_movie/view/Screens/MoviesView.dart';
import 'package:vista_movie/view/Screens/SerchView.dart';
import 'package:vista_movie/view/Screens/SerialsView.dart';
import 'package:vista_movie/view/Screens/register_and_login.dart';
import 'package:vista_movie/view/Screens/signup.dart';

import '../Screens/categories/categoriesScreen.dart';

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
  int _selectedIndex = 2;

  static List<Widget> _widgetOptions = <Widget>[
    MoviesView(),
    SearchView(),
    HomePage(),
    CategoriesScreen(),
    // SerialView(),
    SignUpPage()
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
              icon: Icon(Icons.movie),
              label: 'فیلم ها',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'جستجو',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ویترین',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter_sharp),
              label: 'سته بندی ها',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'حساب کاربری',
            ),
          ],
          backgroundColor: Colors.black.withOpacity(.8),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          selectedFontSize: 15,
          unselectedFontSize: 12,
          selectedIconTheme:IconThemeData(size: 40) ,
          unselectedIconTheme: IconThemeData(size: 20) ,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white24,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
