import 'package:aatmanirbhar/models/AgroModes/agro.soil.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<AgroSoilResponse> fetchSoilData(String polygonID) async {
  // String polygonID = '5f058fa4714b52524fe0a1b7';
  final response = await http.get(
      'http://api.agromonitoring.com/agro/1.0/soil?polyid=$polygonID&appid=3104cf3a98380e9333f8dc55232dae20');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return AgroSoilResponse.fromJson(json.decode(response.body));
  } else {
    print("fail");
    print("response.body");
  }
}
