// pages/pickup_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/pickup_service.dart';
import '../models/pickup_model.dart';

class PickupListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pickupService = Provider.of<PickupService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Pickups'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/pickup_schedule', arguments: 'sampleDonationId');
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Pickup>>(
        stream: pickupService.getPickups(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No pickups available'));
          }
          final pickups = snapshot.data!;
          return ListView.builder(
            itemCount: pickups.length,
            itemBuilder: (context, index) {
              final pickup = pickups[index];
              return ListTile(
                title: Text(
                  'Pickup at ${pickup.scheduledAt.toDate()}',
                  style: TextStyle(color: Colors.green),
                ),
                subtitle: Text(
                  'Status: ${pickup.status}',
                  style: TextStyle(color: Colors.teal),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/pickup_detail', arguments: pickup);
                },
              );
            },
          );
        },
      ),
    );
  }
}
