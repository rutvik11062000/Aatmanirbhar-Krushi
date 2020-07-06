import 'package:aatmanirbhar/pages/detailspage.dart';
import 'package:flutter/material.dart';

class KrushiPage extends StatefulWidget {
  const KrushiPage({Key key}) : super(key: key);

  @override
  _KrushiPageState createState() => _KrushiPageState();
}

class _KrushiPageState extends State<KrushiPage> {
  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * .95;
    double heightC = MediaQuery.of(context).size.height * .15;

    Widget listItemComponent() {
      return Center(
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => DetailPage())),
          child: Container(
            width: widthC,
            height: heightC,
            child: Card(
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/wheat.png'),
                    ),
                  ),
                  title: Text("Wheat"),
                  subtitle: Text("Most produced crop of India"),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return listItemComponent();
            },
          ),
        ),
      ],
    );
  }
}
