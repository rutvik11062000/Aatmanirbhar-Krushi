import 'package:aatmanirbhar/models/AgroModes/AgroWeatherModel/agro.current.weather.model.dart';
import 'package:aatmanirbhar/models/AgroModes/agro.soil.model.dart';
import 'package:aatmanirbhar/pages/map.page.dart';
import 'package:aatmanirbhar/services/AgroApiServices/soil.data.service.dart';
import 'package:aatmanirbhar/services/AgroApiServices/weather.service.dart';
import 'package:aatmanirbhar/widgets/aggregatedata.dart';
import 'package:aatmanirbhar/widgets/current.weather.poly.dart';
import 'package:aatmanirbhar/widgets/soildata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final userRef = Firestore.instance.collection('user');

class Temp extends StatefulWidget {
  const Temp({Key key}) : super(key: key);

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  String defaultText = 'Select part of your land';
  List<String> haveLands = [];
  List<String> defaultList = ['polygon 1', 'polygon 2'];
  AgroSoilResponse agroSoilResponseR = new AgroSoilResponse();
  AgroWeatherPolygonResponse agroWeatherPolygonResponseR =
      new AgroWeatherPolygonResponse();

  onPolyChange(String v) async {
    AgroSoilResponse agroSoilResponse = await fetchSoilData(v);
    AgroWeatherPolygonResponse agroWeatherPolygonResponse =
        await fetchCurrentWeatherPolygon(v);
    setState(() {
      defaultText = v;
      agroSoilResponseR = agroSoilResponse;
      agroWeatherPolygonResponseR = agroWeatherPolygonResponse;
    });
    print(agroWeatherPolygonResponseR.clouds.all);
  }

  @override
  void initState() {
    // TODO: implement initState
    toDo();
    super.initState();
  }

  toDo() async {
    var docRef = userRef.document('CQyjPsOvztXS2eJ36RxJyA5PQNY2');
    var doc = await docRef.get();
    List list = doc['polygons'];
    setState(() {
      haveLands = [];
      list.forEach((element) {
        haveLands.add(element.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            child: KrushiPageHeader(),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: DropdownButton(
                hint: Text(
                  defaultText,
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                items: haveLands.isEmpty
                    ? defaultList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      }).toList()
                    : haveLands.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      }).toList(),
                onChanged: (value) => onPolyChange(value),
              ),
            ),
          ),
          SoilDataWidget(
            moisture: agroSoilResponseR.moisture.toString() == null
                ? "33"
                : agroSoilResponseR.moisture.toString(),
            surfaceTempreature: agroSoilResponseR.t0.toString().isEmpty
                ? "34"
                : agroSoilResponseR.t0.toString(),
            tempreatureD: agroSoilResponseR.t10.toString().isEmpty
                ? "32"
                : agroSoilResponseR.t10.toString(),
          ),
          SizedBox(
            height: 20,
          ),
          AggregateData(
            aggregatePrep: "7.6",
            aggregateTemp: "34",
          ),
          SizedBox(
            height: 20,
          ),
          // CurrentWeatherPolyWidget(
          //   clouds: agroWeatherPolygonResponseR.clouds.toString() == null
          //       ? "40"
          //       : agroWeatherPolygonResponseR.clouds.toString(),
          //   humidity:
          //       agroWeatherPolygonResponseR.main.humidity.toString() == null
          //           ? "3.9"
          //           : agroWeatherPolygonResponseR.main.humidity.toString(),
          //   pressure:
          //       agroWeatherPolygonResponseR.main.pressure.toString() == null
          //           ? "200"
          //           : agroWeatherPolygonResponseR.main.pressure.toString(),
          //   tempreature:
          //       agroWeatherPolygonResponseR.main.temp.toString() == null
          //           ? "36"
          //           : agroWeatherPolygonResponseR.main.temp.toString(),
          //   windDegree: agroWeatherPolygonResponseR.wind.deg.toString() == null
          //       ? "32"
          //       : agroWeatherPolygonResponseR.wind.deg.toString(),
          //   windSpeed: agroWeatherPolygonResponseR.wind.deg.toString() == null
          //       ? "33"
          //       : agroWeatherPolygonResponseR.wind.deg.toString(),
          // ),
          CurrentWeatherPolyWidget(
            clouds: "40",
            humidity: "3.9",
            pressure: "200",
            tempreature: "36",
            windDegree: "32",
            windSpeed: "33",
          ),
          SizedBox(
            height: 20,
          ),
          // KrushiPageHeader()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => MapSample()));
        },
        label: Text('Add Land'),
        icon: Icon(Icons.add_box),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

class KrushiPageHeader extends StatelessWidget {
  KrushiPageHeader({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset(26.0, 28.0),
          child: Container(
            width: 360.0,
            height: 211.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27.0),
              color: const Color(0xffe7e3e3),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(43.0, 38.0),
          child: Container(
            width: 325.0,
            height: 191.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27.0),
              color: const Color(0xffffffff),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(152.0, 57.12),
          child: SvgPicture.string(
            _svg_pl0gd8,
            allowDrawingOutsideViewBox: true,
          ),
        ),
      ],
    );
  }
}

const String _svg_pl0gd8 =
    '<svg viewBox="152.0 57.1 106.6 153.2" ><path transform="translate(1231.0, -431.0)" d="M -1078.9951171875 545.4406127929688 L -1020.88525390625 488.1231384277344 L -972.416259765625 545.4406127929688 L -981.2648315429688 641.3219604492188 L -1066.712768554688 577.1369018554688 L -1078.9951171875 545.4406127929688 Z" fill="#6fc095" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
