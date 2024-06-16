import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:io';
import '../models/user_model.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<AppUser?> getUser(String uid) async {
    try {
      DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
      if (doc.exists) {
        return AppUser.fromFirestore(doc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  Future<void> updateUser(AppUser user) async {
    try {
      await _db.collection('users').doc(user.uid).set(user.toFirestore());
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  Future<String?> uploadProfilePicture(String uid, String filePath) async {
    try {
      final fileName = basename(filePath);
      final ref = _storage.ref().child('profile_pictures/$uid/$fileName');
      final uploadTask = ref.putFile(File(filePath));
      final snapshot = await uploadTask.whenComplete(() {});
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading profile picture: $e');
      return null;
    }
  }
}

