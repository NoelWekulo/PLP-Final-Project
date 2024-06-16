import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path; // Use alias for path package
import '../services/user_service.dart';
import '../services/donation_service.dart';
import '../models/user_model.dart';
import '../models/donation_model.dart';
import 'change_password_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserService _userService = UserService();
  final DonationService _donationService = DonationService();
  final User? user = FirebaseAuth.instance.currentUser;
  AppUser? appUser;
  List<Donation>? donationHistory;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String? _errorMessage;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
    _loadDonationHistory();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Future<void> _loadUserProfile() async {
    if (user != null) {
      appUser = await _userService.getUser(user!.uid);
      if (appUser != null) {
        setState(() {
          nameController.text = appUser!.displayName;
          addressController.text = appUser!.address;
          locationController.text = appUser!.location ?? '';
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'No user profile found.';
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _errorMessage = 'No user is currently signed in.';
        _isLoading = false;
      });
    }
  }

  void _loadDonationHistory() {
    if (user != null) {
      _donationService.getUserDonations(user!.uid).listen((donations) {
        setState(() {
          donationHistory = donations;
        });
      });
    }
  }

  Future<void> _saveUserProfile() async {
    if (user != null) {
      appUser = AppUser(
        uid: user!.uid,
        email: user!.email!,
        displayName: nameController.text,
        address: addressController.text,
        location: locationController.text,
        profilePictureUrl: appUser?.profilePictureUrl,
      );
      await _userService.updateUser(appUser!);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated successfully')));
    }
  }

  Future<void> _changeProfilePicture() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final url = await _userService.uploadProfilePicture(user!.uid, pickedFile.path);
      if (url != null) {
        setState(() {
          appUser = appUser!.copyWith(profilePictureUrl: url);
        });
        await _saveUserProfile();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.teal,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: _changeProfilePicture,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: appUser?.profilePictureUrl != null
                                ? NetworkImage(appUser!.profilePictureUrl!)
                                : AssetImage('assets/default_profile.png') as ImageProvider,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Email: ${user?.email}', style: TextStyle(fontSize: 16, color: Colors.teal)),
                      SizedBox(height: 10),
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.teal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: TextStyle(color: Colors.teal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                          labelText: 'Location',
                          labelStyle: TextStyle(color: Colors.teal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _saveUserProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal, // Changed from `primary`
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                        ),
                        child: Text('Save Profile', style: TextStyle(fontSize: 16.0, color: Colors.white)),
                      ),
                      SizedBox(height: 20),
                      Text('Donation History:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
                      SizedBox(height: 10),
                      donationHistory == null
                          ? Center(child: CircularProgressIndicator())
                          : donationHistory!.isEmpty
                              ? Center(child: Text('No donation history available.'))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: donationHistory!.length,
                                  itemBuilder: (context, index) {
                                    final donation = donationHistory![index];
                                    return Card(
                                      margin: EdgeInsets.symmetric(vertical: 5.0),
                                      child: ListTile(
                                        title: Text(donation.title),
                                        subtitle: Text(donation.description),
                                        trailing: Text(donation.status),
                                      ),
                                    );
                                  },
                                ),
                      SizedBox(height: 20),
                      Text('Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
                      ListTile(
                        leading: Icon(Icons.lock, color: Colors.teal),
                        title: Text('Change Password', style: TextStyle(color: Colors.teal)),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logout, color: Colors.teal),
                        title: Text('Logout', style: TextStyle(color: Colors.teal)),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                      ),
                    ],
                  ),
                ),
    );
  }
}
