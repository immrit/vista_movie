import 'package:flutter/material.dart';
import 'package:vista_movie/Di/di.dart';
import 'package:vista_movie/view/widgets/BottomNavigation.dart';

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
      title: 'Vista Movies',
      locale: Locale('fa', 'IR'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber.shade400,
        ),
        useMaterial3: true,
      ),
      home: HomeBottomNavigation(),
    );
  }
}
