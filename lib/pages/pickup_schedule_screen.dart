// pages/pickup_schedule_screen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/pickup_service.dart';
import '../models/pickup_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PickupScheduleScreen extends StatefulWidget {
  final String donationId;

  PickupScheduleScreen({required this.donationId});

  @override
  _PickupScheduleScreenState createState() => _PickupScheduleScreenState();
}

class _PickupScheduleScreenState extends State<PickupScheduleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scheduledAtController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final pickup = Pickup(
          id: '',
          donationId: widget.donationId,
          userId: user.uid,
          scheduledAt: Timestamp.fromDate(DateTime.parse(_scheduledAtController.text)),
          status: 'scheduled',
        );
        await PickupService().addPickup(pickup);
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Schedule Pickup'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _scheduledAtController,
                decoration: InputDecoration(
                  labelText: 'Scheduled At (YYYY-MM-DD HH:MM:SS)',
                  labelStyle: TextStyle(color: Colors.green),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a scheduled time';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

