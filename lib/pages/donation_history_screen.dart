import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../services/donation_service.dart';
import '../models/donation_model.dart';

class DonationHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final donationService = Provider.of<DonationService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Donation History'),
      ),
      body: user == null
          ? Center(child: Text('Please log in to view your donation history.'))
          : StreamBuilder<List<Donation>>(
              stream: donationService.getUserDonations(user.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text('No donation history available.'));
                }
                final donations = snapshot.data!;
                return ListView.builder(
                  itemCount: donations.length,
                  itemBuilder: (context, index) {
                    final donation = donations[index];
                    return ListTile(
                      title: Text(donation.title),
                      subtitle: Text(donation.description),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/donation_detail',
                          arguments: donation.id,
                        );
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}

