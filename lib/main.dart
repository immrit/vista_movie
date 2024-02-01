import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vista_movie/Di/di.dart';
import 'package:vista_movie/view/widgets/BottomNavigation.dart';
import 'Models/DataModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'view/Screens/HomePage.dart';
void main() async {
  await getItInit();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Locale('fa', 'IR'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: HomeBottomNavigation(),
    );
  }
}
