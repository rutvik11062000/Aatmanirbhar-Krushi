import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:unicorndial/unicorndial.dart';

class MapSample extends StatefulWidget {
  final LocationData locationData;
  MapSample({Key key, this.locationData}) : super(key: key);
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  Location location = new Location();
  LocationData locationData;
  Set<Polygon> _polygons = HashSet<Polygon>();
  int _polygonCounter = 1;
  List<LatLng> polyLatLng = List<LatLng>();
  bool _isPolygon = false;

  Widget _profileOption({IconData iconData, Function onPressed}) {
    return UnicornButton(
        currentButton: FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      // mini: true,
      child: Icon(iconData),
      onPressed: onPressed,
      mini: true,
    ));
  }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonCounter';
    _polygons.add(Polygon(
      polygonId: PolygonId(polygonIdVal),
      points: polyLatLng,
      fillColor: Colors.greenAccent.withOpacity(0.4),
      strokeColor: Colors.green,
      strokeWidth: 5,
    ));
  }

  showSnackBar() {
    final snackBar = SnackBar(
      backgroundColor: Colors.yellow,
      content: Text(
        'Your Part of Land is Saved!🚀',
        style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
      ),
      // action: SnackBarAction(
      //   label: '',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    );

    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    Scaffold.of(context).showSnackBar(snackBar);
  }

  List<UnicornButton> _getProfileMenu() {
    List<UnicornButton> children = [];

    // Add Children here
    children.add(_profileOption(
        iconData: FontAwesomeIcons.searchLocation, onPressed: _goToTheLake));
    children.add(_profileOption(
        iconData: FontAwesomeIcons.drawPolygon,
        onPressed: () {
          setState(() {
            _isPolygon = !_isPolygon;
          });
        }));
    // children.add(_profileOption(iconData: Icons.subdirectory_arrow_left, onPressed: () {}));

    return children;
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.1702, 72.8311),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(20.5937, 78.9629),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            polygons: _polygons,
            onTap: (point) {
              if (_isPolygon) {
                setState(() {
                  polyLatLng.add(point);
                  _setPolygon();
                  print(point.latitude);
                });
              }
            },
          ),
        ],
      ),
      floatingActionButton: _isPolygon == false
          ? UnicornDialer(
              parentButtonBackground: Colors.green,
              orientation: UnicornOrientation.VERTICAL,
              parentButton: Icon(Icons.menu),
              childButtons: _getProfileMenu(),
            )
          : Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FlatButton.icon(
                        color: Colors.green,
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.cross,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Discard",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(width: 8.0),
                    FlatButton.icon(
                        color: Colors.green,
                        onPressed: () {
                          setState(() {
                            _isPolygon = !_isPolygon;
                            polyLatLng = [];
                            _polygons.clear();
                            showSnackBar();
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.solidSave,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    locationData = await location.getLocation();
    CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(locationData.latitude, locationData.longitude),
        // tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
