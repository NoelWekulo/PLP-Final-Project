// pages/pickup_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/pickup_model.dart';

class PickupDetailScreen extends StatelessWidget {
  final Pickup pickup;

  PickupDetailScreen({required this.pickup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pickup Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scheduled At: ${pickup.scheduledAt.toDate()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text('Status: ${pickup.status}'),
            // Add more pickup details here
          ],
        ),
      ),
    );
  }
}
