import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherCart extends StatelessWidget {
  final String city;
  final String date;
  final String tempreature;
  final IconData iconData;
  final String minTemp;
  final String maxTemp;
  final String humidity;
  final String windSpeed;

  WeatherCart({
    Key key,
    this.city,
    this.date,
    this.tempreature,
    this.iconData,
    this.minTemp,
    this.maxTemp,
    this.humidity,
    this.windSpeed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-46.0, -513.0),
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(46.0, 513.0),
                  child: Container(
                    width: 244.0,
                    height: 214.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color(0xff16c6b6),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(46.0, 513.0),
                  child: Container(
                    width: 244.0,
                    height: 59.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.69),
                        end: Alignment(0.0, 1.0),
                        colors: [
                          const Color(0xff16c6b6),
                          const Color(0xff08776d),
                          const Color(0xff004b44)
                        ],
                        stops: [0.0, 0.987, 1.0],
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(152.0, 529.0),
                  child: Text(
                    city.isEmpty ? 'Surat' : city,
                    style: TextStyle(
                      // fontFamily: 'Segoe UI',
                      fontSize: 19,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.47500000000000003,
                      fontWeight: FontWeight.w600,
                      height: 0.631578947368421,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(63.0, 589.0),
                  // child:
                  //     // Adobe XD layer: 'Icon metro-weather3' (shape)
                  //     SvgPicture.string(
                  //   _svg_n4ly89,
                  //   allowDrawingOutsideViewBox: true,
                  // ),
                  child: Icon(
                    FontAwesomeIcons.cloud,
                    size: 55,
                    color: Colors.white,
                  ),
                ),
                Transform.translate(
                  offset: Offset(255.0, 585.0),
                  child: Text(
                    'o',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 19,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.47500000000000003,
                      fontWeight: FontWeight.w600,
                      height: 0.631578947368421,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(175.0, 608.17),
                  child: Text(
                    tempreature.isEmpty ? '36' : tempreature,
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 68,
                      color: const Color(0xffffffff),
                      letterSpacing: 1.7000000000000002,
                      fontWeight: FontWeight.w700,
                      height: 0.6323529411764706,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(72.0, 671.5),
                  child: Text(
                    'Min : 12\nMax : 46',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 11,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.275,
                      fontWeight: FontWeight.w600,
                      height: 1.3636363636363635,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(180.0, 671.5),
                  child: Text(
                    'Humidity : 12\nWind Speed : 46',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 11,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.275,
                      fontWeight: FontWeight.w600,
                      height: 1.3636363636363635,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(114.0, 671.33),
                  child: Text(
                    'o',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 5,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.125,
                      fontWeight: FontWeight.w600,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(117.0, 686.33),
                  child: Text(
                    'o',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 5,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.125,
                      fontWeight: FontWeight.w600,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Transform.translate(
                  offset: Offset(146.0, 541.5),
                  child: Text(
                    date.isEmpty ? '09/07/2020' : date,
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 11,
                      color: const Color(0xffffffff),
                      letterSpacing: 0.275,
                      fontWeight: FontWeight.w600,
                      height: 1.3636363636363635,
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

const String _svg_n4ly89 =
    '<svg viewBox="63.0 589.0 70.9 53.2" ><path transform="translate(60.43, 583.22)" d="M 7.226353168487549 32.38465881347656 C 7.078847408294678 31.65496635437012 7.004404544830322 30.91239738464355 7.004128932952881 30.16794395446777 C 7.004128932952881 24.04593658447266 11.9656867980957 19.08437919616699 18.08769607543945 19.08437919616699 C 19.58563804626465 19.08437919616699 21.00572204589844 19.39028739929199 22.30471611022949 19.92714691162109 C 25.24587631225586 14.18918418884277 31.15119934082031 10.21752548217773 38.03811264038086 10.21752548217773 C 44.92502212524414 10.21752548217773 50.83049011230469 14.18918228149414 53.76860046386719 19.92714500427246 C 55.07057571411133 19.39028549194336 56.49349594116211 19.08437919616699 57.98853302001953 19.08437919616699 C 64.11054229736328 19.08437919616699 69.07210540771484 24.04593849182129 69.07210540771484 30.16794395446777 C 69.07210540771484 30.92703437805176 68.99423980712891 31.66880226135254 68.84696960449219 32.38465881347656 L 73.28038787841797 32.38465881347656 C 73.39011383056641 31.65439033508301 73.50552368164062 30.92703056335449 73.50552368164062 30.16794395446777 C 73.50552368164062 21.61281776428223 66.54366302490234 14.65095138549805 57.98852920532227 14.65095138549805 C 57.25257873535156 14.65095138549805 56.52521896362305 14.70290756225586 55.80063247680664 14.80681419372559 C 51.6617546081543 9.166942596435547 45.1300048828125 5.784099578857422 38.03811264038086 5.784099578857422 C 30.94622039794922 5.784099578857422 24.41758728027344 9.166942596435547 20.27558898925781 14.80681419372559 C 19.55100059509277 14.70290756225586 18.82364273071289 14.65095138549805 18.08769226074219 14.65095138549805 C 9.532566070556641 14.65095138549805 2.570701122283936 21.61281585693359 2.570701122283936 30.16794395446777 C 2.570701122283936 30.92703437805176 2.689017772674561 31.65439033508301 2.795836448669434 32.38465881347656 L 7.226353168487549 32.38465881347656 Z M 71.28881072998047 36.81808471679688 L 4.787414073944092 36.81808471679688 C 3.563649654388428 36.81808471679688 2.570700645446777 37.81103515625 2.570700645446777 39.03479766845703 C 2.570700645446777 40.25856018066406 3.563649654388428 41.25151062011719 4.787414073944092 41.25151062011719 L 71.28881072998047 41.25151062011719 C 72.5125732421875 41.25151062011719 73.50552368164062 40.25856018066406 73.50552368164062 39.03479766845703 C 73.50552368164062 37.81103515625 72.5125732421875 36.81808471679688 71.28881072998047 36.81808471679688 Z M 71.28881072998047 45.6849365234375 L 4.787414073944092 45.6849365234375 C 3.563649654388428 45.6849365234375 2.570700645446777 46.67788696289062 2.570700645446777 47.90164947509766 C 2.570700645446777 49.12541198730469 3.563649654388428 50.11836242675781 4.787414073944092 50.11836242675781 L 71.28881072998047 50.11836242675781 C 72.5125732421875 50.11836242675781 73.50552368164062 49.12541198730469 73.50552368164062 47.90164947509766 C 73.50552368164062 46.67788696289062 72.5125732421875 45.6849365234375 71.28881072998047 45.6849365234375 Z M 71.28881072998047 54.55179595947266 L 4.787414073944092 54.55179595947266 C 3.563649654388428 54.55179595947266 2.570700645446777 55.54474639892578 2.570700645446777 56.76850128173828 C 2.570700645446777 57.99226379394531 3.563649654388428 58.98521423339844 4.787414073944092 58.98521423339844 L 71.28881072998047 58.98521423339844 C 72.5125732421875 58.98521423339844 73.50552368164062 57.99226379394531 73.50552368164062 56.76850128173828 C 73.50552368164062 55.54474639892578 72.5125732421875 54.55179595947266 71.28881072998047 54.55179595947266 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
