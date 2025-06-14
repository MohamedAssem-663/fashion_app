import 'package:fashion/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FashionApp());
}

class FashionApp extends StatelessWidget {
  const FashionApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion App',

      debugShowCheckedModeBanner: false,
      home: Home(),
      
    );
  }
}
