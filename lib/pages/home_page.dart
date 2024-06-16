import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  User? _user;
  String _welcomeMessage = "Welcome to ZERO HUNGER APP!";

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() {
    _user = FirebaseAuth.instance.currentUser;
    if (_user != null) {
      setState(() {
        _welcomeMessage = "Welcome ${_user!.displayName ?? 'User'} to ZERO HUNGER APP!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await _authService.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
               fit: BoxFit.cover,
             ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildWelcomeCard(),
                  SizedBox(height: 20),
                  _buildSectionTitle('Current Campaigns/Events'),
                  _buildCampaignsSection(),
                  SizedBox(height: 20),
                  _buildSectionTitle('News and Updates'),
                  _buildNewsSection(),
                  SizedBox(height: 20),
                  _buildSectionTitle('Upcoming Events/Reminders'),
                  _buildUpcomingEventsSection(),
                  SizedBox(height: 20),
                  _buildSectionTitle('Volunteer Opportunities'),
                  _buildVolunteerOpportunitiesSection(),
                  SizedBox(height: 20),
                  _buildSectionTitle('Donation Progress'),
                  _buildDonationProgressSection(),
                  SizedBox(height: 20),
                  _buildSectionTitle('Nearby Hunger Relief Efforts'),
                  _buildMapSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            if (_user?.photoURL != null)
              CircleAvatar(
                backgroundImage: NetworkImage(_user!.photoURL!),
                radius: 40.0,
              ),
            SizedBox(width: 20),
            Expanded(
              child: Text(
                _welcomeMessage,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  color: Colors.teal[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
        color: Colors.teal[800],
      ),
    );
  }

  Widget _buildCampaignsSection() {
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Image.asset(
              'assets/images/campaign1.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red); // Placeholder for error
              },
            ),
          ),
          title: Text('Campaign 1: Feed the Hungry'),
          subtitle: Text('Join us in providing meals to the needy.'),
        ),
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Image.asset(
              'assets/images/event2.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red); // Placeholder for error
              },
            ),
          ),
          title: Text('Event 2: Food Drive'),
          subtitle: Text('Participate in our community food drive.'),
        ),
      ],
    );
  }

  Widget _buildNewsSection() {
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Image.asset(
              'assets/images/news1.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red); // Placeholder for error
              },
            ),
          ),
          title: Text('News 1: New Initiatives Launched'),
          subtitle: Text('Read about our latest hunger relief initiatives.'),
        ),
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Image.asset(
              'assets/images/update2.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red); // Placeholder for error
              },
            ),
          ),
          title: Text('Update 2: Success Stories'),
          subtitle: Text('Discover the impact of our efforts through success stories.'),
        ),
      ],
    );
  }

  Widget _buildUpcomingEventsSection() {
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Image.asset(
              'assets/images/event_reminder.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red); // Placeholder for error
              },
            ),
          ),
          title: Text('Event Reminder: Community Kitchen'),
          subtitle: Text('Join us this Saturday at the community kitchen.'),
        ),
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Image.asset(
              'assets/images/volunteer_meeting.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red); // Placeholder for error
              },
            ),
          ),
          title: Text('Reminder: Volunteer Meeting'),
          subtitle: Text('Next volunteer meeting is on Friday at 5 PM.'),
        ),
      ],
    );
  }

  Widget _buildVolunteerOpportunitiesSection() {
    return Column(
      children: [
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Image.asset(
              'assets/images/meal_prep.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red); // Placeholder for error
              },
            ),
          ),
          title: Text('Opportunity 1: Meal Prep Volunteer'),
          subtitle: Text('Help prepare meals for the homeless every Monday.'),
        ),
        ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Image.asset(
              'assets/images/donation_organizer.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: Colors.red); // Placeholder for error
              },
            ),
          ),
          title: Text('Opportunity 2: Donation Organizer'),
          subtitle: Text('Assist in organizing donated goods every Wednesday.'),
        ),
      ],
    );
  }

  Widget _buildDonationProgressSection() {
    return Column(
      children: [
        ListTile(
          title: Text('Donation Goal: 1000 Meals'),
          subtitle: LinearProgressIndicator(
            value: 0.7, // Replace with your actual progress value
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
        ListTile(
          title: Text('Fundraising Goal: \$10,000'),
          subtitle: LinearProgressIndicator(
            value: 0.5, // Replace with your actual progress value
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      ],
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal, width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Replace with your actual location
          zoom: 12,
        ),
        markers: {
          Marker(
            markerId: MarkerId('1'),
            position: LatLng(37.7749, -122.4194), // Replace with your actual location
            infoWindow: InfoWindow(
              title: 'Donation Center',
              snippet: 'Drop off your donations here.',
            ),
          ),
        },
      ),
    );
  }
}
