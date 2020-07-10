import 'package:aatmanirbhar/pages/homepage.dart';
import 'package:aatmanirbhar/pages/login.dart';
import 'package:aatmanirbhar/pages/map.page.dart';
import 'package:aatmanirbhar/pages/search.city.dart';
import 'package:aatmanirbhar/pages/tempPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  Location location = new Location();
  PageController pageController;

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData locationData;
  @override
  void initState() {
    pageController = PageController();
    _checkLocationPermission();
    super.initState();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.jumpToPage(
      pageIndex,
    );
  }

  _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
  }

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
    MapSample(),
    // KrushiPage()
    // MiddlePage(),
    Temp()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text("Aatmanirbhar Krushi",
            style: TextStyle(fontWeight: FontWeight.w600)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<int>(
              onSelected: (value) {
                switch (value) {
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchCity()),
                    );
                    break;
                  default:
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.search),
                    title: Text("Search city wise"),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.signOutAlt),
                    title: Text("Sign Out"),
                  ),
                ),
              ],
              icon: Icon(Icons.more_horiz),
              offset: Offset(0, 100),
            ),
          ),
        ],
      ),
      body: PageView(
        children: pages,
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        onTap: onTap, // new
        currentIndex: pageIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.map), title: Text('Make Polygon')),
          new BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.tractor),
            title: Text('Kruhsi'),
          ),
        ],
      ),
    );
  }
}
