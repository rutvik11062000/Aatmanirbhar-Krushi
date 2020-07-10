import 'package:aatmanirbhar/models/weather.model.dart';
import 'package:aatmanirbhar/services/getWeather.dart';
import 'package:aatmanirbhar/widgets/forecast.dart';
import 'package:aatmanirbhar/widgets/history.dart';
import 'package:aatmanirbhar/widgets/tabitem.dart';
import 'package:aatmanirbhar/widgets/weatherCart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aatmanirbhar/services/api.services.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
  String result;
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    result = "0'c";
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.teal,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.teal,
                image: DecorationImage(
                  // scale: 1.5,
                  image: AssetImage('assets/images/header.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: EdgeInsets.all(20),
          //     child: TextFormField(
          //       controller: _textController,
          //       autofocus: false,
          //       decoration: InputDecoration(
          //         hintText: 'Surat',
          //         prefixIcon: Icon(
          //           FontAwesomeIcons.city,
          //           size: 15,
          //         ),
          //         suffixIcon: IconButton(
          //             icon: Icon(FontAwesomeIcons.search, size: 15),
          //             onPressed: () => getResult()),
          //         hintStyle: TextStyle(color: Colors.grey),
          //         filled: true,
          //         fillColor: Colors.white70,
          //         enabledBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(12.0)),
          //           borderSide: BorderSide(color: Colors.green, width: 2),
          //         ),
          //         focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
          //           borderSide: BorderSide(color: Colors.green, width: 2),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // isloading
          //     ? Center(child: CircularProgressIndicator())
          //     : Expanded(
          //         flex: 2,
          //         child: Text(
          //           "min temp: $result",
          //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //         )),
          Expanded(
            flex: 3,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: TabBar(
                  labelColor: Colors.teal,
                  tabs: [
                    TabItem(
                      title: "Current",
                    ),
                    TabItem(
                      title: "Forecast",
                    ),
                    TabItem(
                      title: "History",
                    ),
                  ],
                ),
                body: TabBarView(
                  children: [
                    WeatherCart(
                      city: "Surat",
                      date: "10/07/2020",
                      humidity: "82%",
                      iconData: FontAwesomeIcons.cloudRain,
                      maxTemp: "48",
                      minTemp: "38",
                      tempreature: "30",
                      windSpeed: "23 km/h",
                    ),
                    ForecastSubWeather(),
                    HistorySubWeather(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
