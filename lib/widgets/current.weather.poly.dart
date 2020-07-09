import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrentWeatherPolyWidget extends StatelessWidget {
  final String tempreature;
  final String pressure;
  final String humidity;
  final String windSpeed;
  final String windDegree;
  final String clouds;
  CurrentWeatherPolyWidget({
    Key key,
    this.tempreature,
    this.pressure,
    this.humidity,
    this.windSpeed,
    this.windDegree,
    this.clouds,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-26.0, -501.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(26.0, 501.0),
                  child: Container(
                    width: 360.0,
                    height: 211.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(27.0),
                      color: const Color(0xffe7e3e3),
                    ),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(57.0, 522.83),
                      child: Text(
                        'Current weather (Poly) :',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 26,
                          color: const Color(0xff000000),
                          letterSpacing: 0.65,
                          fontWeight: FontWeight.w600,
                          height: 1.3461538461538463,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(57.5, 561.5),
                      child: SvgPicture.string(
                        _svg_23kkeg,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ],
                ),
                Transform.translate(
                  offset: Offset(57.0, 570.33),
                  child: Text(
                    'Temperature\nPressure\nHumidity\nWind speed\nWind degree\nClouds\n',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 11,
                      color: const Color(0xff000000),
                      letterSpacing: 0.275,
                      fontWeight: FontWeight.w600,
                      height: 1.8181818181818181,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(203.0, 570.33),
                  child: Text(
                    tempreature.isEmpty &&
                            pressure.isEmpty &&
                            humidity.isEmpty &&
                            windSpeed.isEmpty &&
                            windDegree.isEmpty &&
                            clouds.isEmpty
                        ? 'T\nP\nH\nWS\nWD\nC\n'
                        : "$tempreature\n$pressure\n$humidity\n$windSpeed\n$windDegree\n$clouds",
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 11,
                      color: const Color(0xff000000),
                      letterSpacing: 0.275,
                      fontWeight: FontWeight.w600,
                      height: 1.8181818181818181,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(162.0, 570.33),
                  child: Text(
                    ':\n:\n:\n:\n:\n:\n',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 11,
                      color: const Color(0xff000000),
                      letterSpacing: 0.275,
                      fontWeight: FontWeight.w600,
                      height: 1.8181818181818181,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_23kkeg =
    '<svg viewBox="57.5 561.5 277.0 1.0" ><path transform="translate(57.5, 561.5)" d="M 0 0 L 277 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
