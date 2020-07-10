import 'dart:collection';
import 'dart:convert';
import 'package:aatmanirbhar/models/api.request.model.dart' as Request;
import 'package:aatmanirbhar/models/api.response.model.dart';
import 'package:aatmanirbhar/services/firestore.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:unicorndial/unicorndial.dart';

final userRef = Firestore.instance.collection('user');

class MapSample extends StatefulWidget {
  // final LocationData locationData;
  MapSample({Key key}) : super(key: key);
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample>
    with AutomaticKeepAliveClientMixin {
  Completer<GoogleMapController> _controller = Completer();
  Location location = new Location();
  LocationData locationData;
  Set<Polygon> _polygons = HashSet<Polygon>();
  int _polygonCounter = 1;
  List<LatLng> polyLatLng = List<LatLng>();
  bool _isPolygon = false;

  void createConnection(Request.ApiRequest request) async {
    final http.Response response = await http.post(
      'http://api.agromonitoring.com/agro/1.0/polygons?appid=3104cf3a98380e9333f8dc55232dae20',
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode == 201) {
      ApiResponse res = ApiResponse.fromJson(json.decode(response.body));
      print(response.body);
      print(res.id);
      addPolygonData(res.id);
      showSnackBar();
    } else {
      print("failed");
      print(response.body);
      // throw Exception('Failed to load album');
      showSnackBar1(response.body);
    }
  }

  void fetchAlbum() async {
    final response = await http
        .get('http://api.agromonitoring.com/agro/1.0/polygons?appid= tr4t ');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // dynamic f = AgroResponse.fromJson(json.decode(response.body));
      print(response.body);
      print("pass");
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

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

  showSnackBar1(String body) {
    final snackBar = SnackBar(
      backgroundColor: Colors.yellow,
      content: Text(
        body,
        style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  showSnackBar() {
    final snackBar = SnackBar(
      backgroundColor: Colors.yellow,
      content: Text(
        'Your Part of Land is Saved!🚀',
        style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  List<UnicornButton> _getProfileMenu() {
    List<UnicornButton> children = [];

    // Add Children here
    children.add(_profileOption(
        iconData: FontAwesomeIcons.searchLocation,
        onPressed: () {
          _goToTheLake();
        }));
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
    target: LatLng(21.1071413, 71.688775),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(20.5937, 78.9629),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Future<http.Response> createAlbum(String title) {
    return http.post(
      'http://api.agromonitoring.com/agro/1.0/polygons?appid=3f60fea56824398070cbf075be1e8b90',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
  }

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
              parentButtonBackground: Colors.teal,
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
                          polyLatLng.add(polyLatLng[0]);
                          Request.Geometry geometry = new Request.Geometry(
                              type: "Polygon", coordinates: [polyLatLng]);
                          Request.Properties properties =
                              new Request.Properties();
                          Request.GeoJson geoJson = new Request.GeoJson(
                              geometry: geometry,
                              properties: properties,
                              type: "Feature");

                          Request.ApiRequest req = new Request.ApiRequest(
                              geo_json: geoJson, name: "aatmanirbharkrushi");
                          // print(req.geo_json.geometry.coordinates);
                          setState(() {
                            _isPolygon = !_isPolygon;
                            polyLatLng = [];
                            _polygons.clear();
                          });
                          createConnection(req);

                          // print(polyLatLng);
                          // fetchAlbum();
                          // print(jsonEncode(req.toJson()));
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

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
