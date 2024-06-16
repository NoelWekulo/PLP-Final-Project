import 'package:cloud_firestore/cloud_firestore.dart';

class LocationService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> updateLocation(double lat, double lng) {
    return _db.collection('locations').add({
      'latitude': lat,
      'longitude': lng,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
