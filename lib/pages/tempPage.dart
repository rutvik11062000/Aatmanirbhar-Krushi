import 'package:aatmanirbhar/pages/map.page.dart';
import 'package:aatmanirbhar/widgets/aggregatedata.dart';
import 'package:aatmanirbhar/widgets/current.weather.poly.dart';
import 'package:aatmanirbhar/widgets/soildata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Temp extends StatefulWidget {
  const Temp({Key key}) : super(key: key);

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> with AutomaticKeepAliveClientMixin {
  String defaultText = 'Select Part of Land';
  List<String> haveLands = ['polygon 1', 'polygon 2'];

  onPolyChange(String v) {
    setState(() {
      defaultText = v;
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
                items: haveLands.map<DropdownMenuItem<String>>((String value) {
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
            moisture: "33",
            surfaceTempreature: "34",
            tempreatureD: "32",
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
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
