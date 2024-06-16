import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  final double latitude;
  final double longitude;
  final Timestamp timestamp;

  LocationModel({required this.latitude, required this.longitude, required this.timestamp});

  factory LocationModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return LocationModel(
      latitude: data['latitude'],
      longitude: data['longitude'],
      timestamp: data['timestamp'],
    );
  }
}
