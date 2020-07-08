import 'package:cloud_firestore/cloud_firestore.dart';

final userRef = Firestore.instance.collection('user');

addPolygonData(String polygonID) async {
  final docRef = userRef.document('rutvik');
  DocumentSnapshot doc = await docRef.get();
  List polygons = doc['Polygons'];
  polygons.add(polygonID);
  docRef.updateData({'Polygons': polygons});
}
