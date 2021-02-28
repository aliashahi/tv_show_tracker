import 'package:flutter/material.dart';
import 'package:watch_list_tracker/screens/detail_screen/detail_screen.dart';
import 'package:watch_list_tracker/screens/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
