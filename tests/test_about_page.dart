import 'package:flutter/material.dart';
import 'flutterviz/about_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutPage(),
    );
  }
}