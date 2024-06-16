import 'package:flutter/material.dart';
import '../models/donation_model.dart';
import '../services/donation_service.dart';

class DonationDetailScreen extends StatelessWidget {
  final String donationId;

  DonationDetailScreen({required this.donationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation Detail'),
      ),
      body: FutureBuilder<Donation?>(
        future: DonationService().getDonation(donationId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final donation = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donation.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  donation.description,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text('Category: ${donation.category}'),
                Text('Status: ${donation.status}'),
                SizedBox(height: 20),
                Text(
                  'Impact of your donation:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                // Display some mock impact metrics
                Text('People fed: 50'),
                Text('Items distributed: 30'),
                // Add more impact details here
              ],
            ),
          );
        },
      ),
    );
  }
}


