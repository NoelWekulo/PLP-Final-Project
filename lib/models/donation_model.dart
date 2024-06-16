import 'package:cloud_firestore/cloud_firestore.dart';

class Donation {
  final String id;
  final String title;
  final String description;
  final String status;
  final String category;
  final String userId;
  final Timestamp createdAt;

  Donation({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.category,
    required this.userId,
    required this.createdAt,
  });

  factory Donation.fromFirestore(Map<String, dynamic> data) {
    return Donation(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      status: data['status'] ?? '',
      category: data['category'] ?? '',
      userId: data['userId'] ?? '',
      createdAt: data['createdAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'category': category,
      'userId': userId,
      'createdAt': createdAt,
    };
  }
}





