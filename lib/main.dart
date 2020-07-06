import 'package:aatmanirbhar/pages/homepage.dart';
import 'package:aatmanirbhar/pages/krushipage.dart';
import 'package:aatmanirbhar/pages/personalpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> pages = [
    HomePage(
      title: "Aatmanirbhar Krushi",
    ),
    KrushiPage(),
    Personalpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Aatmanirbhar Krushi"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.solidUserCircle,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: IndexedStack(
        index: _currentIndex,
        children: pages
      )), // new
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.tractor),
            title: Text('Kruhsi'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidUserCircle), title: Text('Profile'))
        ],
      ),
    );
  }
}
