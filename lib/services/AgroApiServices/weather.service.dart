import 'package:aatmanirbhar/models/AgroModes/AgroWeatherModel/agro.current.weather.model.dart';
import 'package:aatmanirbhar/models/AgroModes/AgroWeatherModel/agro.forecast.weather.model.dart';
import 'package:aatmanirbhar/models/AgroModes/AgroWeatherModel/agro.history.weather.polygon.model.dart';
import 'package:aatmanirbhar/models/AgroModes/agro.soil.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<AgroWeatherPolygonResponse> fetchCurrentWeatherPolygon(
    String polygonID) async {
  // String polygonID = '5f058fa4714b52524fe0a1b7';
  final response = await http.get(
      'http://api.agromonitoring.com/agro/1.0/weather?polyid=$polygonID&appid=3104cf3a98380e9333f8dc55232dae20');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return AgroWeatherPolygonResponse.fromJson(json.decode(response.body));
  } else {
    print("fail");
    print("response.body");
  }
}

Future<AgroForecastPolygonResponse> fetchForecastWeatherPolygon() async {
  String polygonID = '5f058fa4714b52524fe0a1b7';
  final response = await http.get(
      'http://api.agromonitoring.com/agro/1.0/weather/forecast?polyid=$polygonID&appid=3104cf3a98380e9333f8dc55232dae20');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var f = response.body;
    f = '{"r":' + f + "}";
    print(response.body);
    return AgroForecastPolygonResponse.fromJson(json.decode(f));
  } else {
    print("fail");
    print("response.body");
  }
}
// &start=1485703465&end=1485780512

Future<AgroHistoryWeatherPolygon> fetchHistoricalWeatherPolygon() async {
  String polygonID = '5f058fa4714b52524fe0a1b7';
  final response = await http.get(
      'http://api.agromonitoring.com/agro/1.0/weather/forecast?polyid=$polygonID&appid=3104cf3a98380e9333f8dc55232dae2&start=1485703465&end=14857805120');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var f = response.body;
    f = '{"r":' + f + "}";
    print(response.body);
    return AgroHistoryWeatherPolygon.fromJson(json.decode(f));
  } else {
    print("fail");
    print(response.body);
  }
}
