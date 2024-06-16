// services/pickup_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pickup_model.dart';

class PickupService {
  final CollectionReference pickupCollection = FirebaseFirestore.instance.collection('pickups');

  // Add pickup
  Future<void> addPickup(Pickup pickup) async {
    try {
      await pickupCollection.add(pickup.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  // Get pickups
  Stream<List<Pickup>> getPickups() {
    return pickupCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Pickup.fromFirestore(doc);
      }).toList();
    });
  }
}
