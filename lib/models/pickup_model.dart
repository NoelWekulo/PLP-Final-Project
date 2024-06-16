// models/pickup_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Pickup {
  final String id;
  final String donationId;
  final String userId;
  final Timestamp scheduledAt;
  final String status;

  Pickup({
    required this.id,
    required this.donationId,
    required this.userId,
    required this.scheduledAt,
    required this.status,
  });

  factory Pickup.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Pickup(
      id: doc.id,
      donationId: data['donationId'] ?? '',
      userId: data['userId'] ?? '',
      scheduledAt: data['scheduledAt'] ?? Timestamp.now(),
      status: data['status'] ?? 'scheduled',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'donationId': donationId,
      'userId': userId,
      'scheduledAt': scheduledAt,
      'status': status,
    };
  }
}
