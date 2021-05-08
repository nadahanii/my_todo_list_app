import 'package:flutter/material.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        //primaryColor: Colors.white54,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
