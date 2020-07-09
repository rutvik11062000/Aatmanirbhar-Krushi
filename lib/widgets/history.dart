import 'package:aatmanirbhar/widgets/weatherCart.dart';
import 'package:flutter/material.dart';

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
            child: WeatherCart(),
          );
        },
      ),
    );
  }
}
