import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String title;
  const TabItem({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Text(
        "$title",
        style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w800),
      ),
    );
  }
}
