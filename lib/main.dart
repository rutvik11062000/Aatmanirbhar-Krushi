import 'package:aatmanirbhar/pages/login.dart';
// import 'package:aatmanirbhar/pages/mainPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aatmanirbhar Krushi',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'OpenSans'),
      home: Login(),
    );
  }
}
