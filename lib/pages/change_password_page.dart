import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _errorMessage;

  Future<void> _changePassword() async {
    if (_newPasswordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = 'New password and confirmation do not match';
      });
      return;
    }

    try {
      User? user = _auth.currentUser;
      String email = user!.email!;

      await _auth.signInWithEmailAndPassword(email: email, password: _oldPasswordController.text);
      await user.updatePassword(_newPasswordController.text);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password changed successfully')));
      Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _errorMessage = 'Error changing password: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _oldPasswordController,
              decoration: InputDecoration(labelText: 'Old Password'),
              obscureText: true,
            ),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(labelText: 'New Password'),
              obscureText: true,
            ),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changePassword,
              child: Text('Change Password'),
            ),
            if (_errorMessage != null) ...[
              SizedBox(height: 20),
              Text(_errorMessage!, style: TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}
