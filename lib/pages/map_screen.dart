import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('locations').snapshots().listen((event) {
      setState(() {
        _markers.clear();
        event.docs.forEach((doc) {
          GeoPoint pos = doc['location'];
          _markers.add(
            Marker(
              markerId: MarkerId(doc.id),
              position: LatLng(pos.latitude, pos.longitude),
            ),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.77483, -122.41942), // Default to San Francisco
          zoom: 12,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
