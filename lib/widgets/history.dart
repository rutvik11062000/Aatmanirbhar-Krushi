import 'package:aatmanirbhar/widgets/weatherCart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HistorySubWeather extends StatelessWidget {
  const HistorySubWeather({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10.0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: WeatherCart(
              city: "Surat",
              date: "10/07/2020",
              humidity: "1.8",
              iconData: FontAwesomeIcons.cloud,
              maxTemp: "48",
              minTemp: "38",
              tempreature: "36",
              windSpeed: "100",
            ),
          );
        },
      ),
    );
  }
}
