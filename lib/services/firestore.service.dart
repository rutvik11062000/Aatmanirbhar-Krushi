import 'package:cloud_firestore/cloud_firestore.dart';

final userRef = Firestore.instance.collection('user');

addPolygonData(String polygonID) async {
  final docRef = userRef.document('CQyjPsOvztXS2eJ36RxJyA5PQNY2');
  DocumentSnapshot doc = await docRef.get();
  List polygons = doc['polygons'];
  polygons.add(polygonID);
  docRef.updateData({'polygons': polygons});
}
