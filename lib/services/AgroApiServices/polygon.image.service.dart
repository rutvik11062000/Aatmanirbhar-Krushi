import 'package:aatmanirbhar/models/AgroModes/agro.image.response.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<AgroImageResponse> fetchPolygonImage() async {
  String polygonID = '5f058fa4714b52524fe0a1b7';
  var start = new DateTime.utc(2020, 06, 15);
  var end = new DateTime.utc(2020, 07, 4);
  final startd = '1483218000';
  final endd = '1504213200';
  final response = await http.get(
      'http://api.agromonitoring.com/agro/1.0/image/search?start=$startd&end=$endd&polyid=$polygonID&appid=3104cf3a98380e9333f8dc55232dae20');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    print(
        'http://api.agromonitoring.com/agro/1.0/image/search?start=$startd&end=$endd&polyid=$polygonID&appid=3104cf3a98380e9333f8dc55232dae20');
    var f = response.body;
    f = '{"r":' + f + "}";
    return AgroImageResponse.fromJson(json.decode(f));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // throw Exception('Failed to load album');
    print(
        'http://api.agromonitoring.com/agro/1.0/image/search?start=$startd&end=$endd&polyid=$polygonID&appid=3104cf3a98380e9333f8dc55232dae20');
    print(response.body);
  }
}
