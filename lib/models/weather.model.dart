// import 'package:equatable/equatable.dart';

class Weather {
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;
  final double humidity;

  Weather({
    this.formattedCondition,
    this.minTemp,
    this.temp,
    this.maxTemp,
    this.locationId,
    this.created,
    this.lastUpdated,
    this.location,
    this.humidity,
  });

  static Weather fromJson(dynamic json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return Weather(
        formattedCondition: consolidatedWeather['weather_state_name'],
        minTemp: consolidatedWeather['min_temp'] as double,
        temp: consolidatedWeather['the_temp'] as double,
        maxTemp: consolidatedWeather['max_temp'] as double,
        locationId: json['woeid'] as int,
        created: consolidatedWeather['created'],
        lastUpdated: DateTime.now(),  
        location: json['title'],
        humidity: json['humidity']
        );
  }

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
