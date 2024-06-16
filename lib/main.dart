import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pages/login_page.dart';
import 'pages/main_screen.dart';
import 'pages/profile_page.dart';
import 'pages/donation_list_screen.dart';
import 'pages/donation_detail_screen.dart';
import 'pages/add_donation_screen.dart';
import 'pages/pickup_schedule_screen.dart';
import 'pages/pickup_detail_screen.dart';
import 'pages/pickup_list_screen.dart';
import 'pages/donation_history_screen.dart';
import 'pages/map_screen.dart'; // Add this import
import 'services/auth_service.dart';
import 'services/donation_service.dart';
import 'services/pickup_service.dart';
import 'services/user_service.dart';
import 'services/local_notification_service.dart'; // Add this import
import 'services/notification_service.dart'; // Add this import
import 'models/pickup_model.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await LocalNotificationService().initialize(); // Initialize LocalNotificationService
  await NotificationService().initialize(); // Initialize NotificationService

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<DonationService>(create: (_) => DonationService()),
        Provider<PickupService>(create: (_) => PickupService()),
        Provider<UserService>(create: (_) => UserService()),
      ],
      child: MaterialApp(
        title: 'Zero Hunger App',
        theme: ThemeData(
          primaryColor: Color(0xFF800020), // Deep Burgundy
          scaffoldBackgroundColor: Color(0xFFD3D3D3), // Light Gray
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red, // Custom primary color
            accentColor: Color(0xFFFFD700), // Gold
          ).copyWith(
            secondary: Color(0xFFFFD700), // Gold
            primary: Color(0xFF800020), // Deep Burgundy
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => AuthWrapper(),
          '/login': (context) => LoginPage(),
          '/main': (context) => MainScreen(),
          '/profile': (context) => ProfilePage(),
          '/donations': (context) => DonationListScreen(),
          '/add_donation': (context) => AddDonationScreen(),
          '/donation_history': (context) => DonationHistoryScreen(),
          '/pickup_list': (context) => PickupListScreen(),
          '/map': (context) => MapScreen(), // Add this route
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/donation_detail') {
            final donationId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => DonationDetailScreen(donationId: donationId),
            );
          }
          if (settings.name == '/pickup_schedule') {
            final donationId = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => PickupScheduleScreen(donationId: donationId),
            );
          }
          if (settings.name == '/pickup_detail') {
            final pickup = settings.arguments as Pickup;
            return MaterialPageRoute(
              builder: (context) => PickupDetailScreen(pickup: pickup),
            );
          }
          return null;
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return MainScreen();
        } else {
          return LoginPage();
        }
      },
    );
  }
}


