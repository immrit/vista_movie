import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<void> fetchData() async {
    final uri = Uri.parse('http://10.0.2.2:8080/go');
    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = response.body;
        print(data);
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors or exceptions
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Request Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchData,
          child: Text(
            "Click Me",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
