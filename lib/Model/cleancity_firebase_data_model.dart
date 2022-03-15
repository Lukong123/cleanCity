import 'package:cloud_firestore/cloud_firestore.dart';

class cleanCityFirebaseData {
  late final String id;
  late final bool isfull;
  late GeoPoint location;

  cleanCityFirebaseData({
    required this.id,
    required this.isfull,
    required this.location,
  });
}
