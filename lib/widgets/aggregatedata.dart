import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AggregateData extends StatelessWidget {
  final String aggregateTemp;
  final String aggregatePrep;
  AggregateData({
    Key key,
    this.aggregateTemp,
    this.aggregatePrep,
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
                        'Aggregate Data :',
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
                        _svg_444jp6,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(54.0, 589.5),
                      child: Text(
                        'Aggregate Temperature',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 11,
                          color: const Color(0xff000000),
                          letterSpacing: 0.275,
                          fontWeight: FontWeight.w600,
                          height: 1.3636363636363635,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(54.0, 622.5),
                      child: Text(
                        'Aggregate Rain / Precipitation',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 11,
                          color: const Color(0xff000000),
                          letterSpacing: 0.275,
                          fontWeight: FontWeight.w600,
                          height: 1.3636363636363635,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(246.0, 589.5),
                      child: Text(
                        ':',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 11,
                          color: const Color(0xff000000),
                          letterSpacing: 0.275,
                          fontWeight: FontWeight.w600,
                          height: 1.3636363636363635,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(246.0, 622.5),
                      child: Text(
                        ':',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 11,
                          color: const Color(0xff000000),
                          letterSpacing: 0.275,
                          fontWeight: FontWeight.w600,
                          height: 1.3636363636363635,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(300.0, 589.5),
                      child: Text(
                        aggregateTemp.isEmpty ? 'x' : aggregateTemp,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 11,
                          color: const Color(0xff000000),
                          letterSpacing: 0.275,
                          fontWeight: FontWeight.w600,
                          height: 1.3636363636363635,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(300.0, 622.5),
                      child: Text(
                        aggregatePrep.isEmpty ? 'y' : aggregatePrep,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 11,
                          color: const Color(0xff000000),
                          letterSpacing: 0.275,
                          fontWeight: FontWeight.w600,
                          height: 1.3636363636363635,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_444jp6 =
    '<svg viewBox="57.5 561.5 210.0 1.0" ><path transform="translate(57.5, 561.5)" d="M 0 0 L 210 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
