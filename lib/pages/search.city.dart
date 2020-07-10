import 'package:aatmanirbhar/services/api.services.dart';
import 'package:aatmanirbhar/services/getWeather.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aatmanirbhar/models/weather.model.dart';

import 'package:http/http.dart' as http;

class SearchCity extends StatefulWidget {
  SearchCity({Key key}) : super(key: key);

  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final TextEditingController _textController = TextEditingController();
  String result;
  bool isloading = false;

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  getResult() async {
    try {
      setState(() {
        isloading = true;
      });
      final Weather weather =
          await weatherRepository.getWeather(_textController.text);
      print(weather.minTemp);
      print("haye");
      setState(() {
        result = weather.minTemp.toString();
        isloading = false;
      });
    } catch (_) {
      setState(() {
        result = "try again..";
        isloading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    result = "0'c";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search city wise'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: _textController,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Surat',
                    prefixIcon: Icon(
                      FontAwesomeIcons.city,
                      size: 15,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(FontAwesomeIcons.search, size: 15),
                        onPressed: () => getResult()),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            isloading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    flex: 2,
                    child: Text(
                      "min temp: $result",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
          ],
        ),
      ),
    );
  }
}
