// donation_item_widget.dart
import 'package:flutter/material.dart';
import 'data.dart'; // Import the dummy data model

class DonationItemWidget extends StatelessWidget {
  final DonationItem item;

  DonationItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              item.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              item.description,
              style: TextStyle(fontSize: 12.0),
            ),
            SizedBox(height: 4.0),
            Text(
              'Location: ${item.location}',
              style: TextStyle(fontSize: 12.0),
            ),
            Text(
              'Availability: ${item.available ? "Available" : "Not available"}',
              style: TextStyle(fontSize: 12.0, color: item.available ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}


