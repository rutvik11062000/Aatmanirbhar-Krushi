import 'package:aatmanirbhar/models/AgroModes/AgroAggregateModel/agro.aggregate.temp.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<AgroAggregateTempratureResponse> fetchAggregateTemp() async {
  String polygonID = '5f058fa4714b52524fe0a1b7';
  final startd = '1483218000';
  final endd = '1504213200';
  final response = await http.get(
      'http://api.agromonitoring.com/agro/1.0/weather/history/accumulated_temperature?polyid=$polygonID&start=$startd&end=$endd&threshold=284&appid=3104cf3a98380e9333f8dc55232dae20');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    // print(
    // 'http://api.agromonitoring.com/agro/1.0/image/search?start=$startd&end=$endd&polyid=$polygonID&appid=3104cf3a98380e9333f8dc55232dae20');
    var f = response.body;
    f = '{"r":' + f + "}";
    return AgroAggregateTempratureResponse.fromJson(json.decode(f));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    // throw Exception('Failed to load album');
    // print(
    //     'http://api.agromonitoring.com/agro/1.0/image/search?start=$startd&end=$endd&polyid=$polygonID&appid=3104cf3a98380e9333f8dc55232dae20');
    print(response.body);
    print("fail");
    print(
        'http://api.agromonitoring.com/agro/1.0/weather/history/accumulated_temperature?polyid=$polygonID&start=$startd&end=$endd&threshold=284&appid=3104cf3a98380e9333f8dc55232dae20');
  }
}
