import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/donation_model.dart';

class DonationService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Donation>> getUserDonations(String uid) {
    return _db.collection('donations')
      .where('userId', isEqualTo: uid)
      .snapshots()
      .map((snapshot) => snapshot.docs
        .map((doc) => Donation.fromFirestore(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<Donation?> getDonation(String donationId) async {
    try {
      DocumentSnapshot doc = await _db.collection('donations').doc(donationId).get();
      if (doc.exists) {
        return Donation.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching donation: $e');
      return null;
    }
  }

  Future<void> addDonation(Donation donation) async {
    try {
      await _db.collection('donations').add(donation.toFirestore());
    } catch (e) {
      print('Error adding donation: $e');
    }
  }
}


