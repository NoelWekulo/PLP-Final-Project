import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: _forgotPassword,
              child: Text('Forgot Password?', style: TextStyle(color: Colors.teal)),
            ),
            SizedBox(height: 20),
            if (_isLoading)
              CircularProgressIndicator()
            else
              Column(
                children: [
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    ),
                    child: Text('Login', style: TextStyle(fontSize: 16.0)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    ),
                    child: Text('Sign Up', style: TextStyle(fontSize: 16.0)),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _signInWithGoogle,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                    ),
                    child: Text('Sign in with Google', style: TextStyle(fontSize: 16.0)),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  void _setErrorMessage(String? errorMessage) {
    setState(() {
      _errorMessage = errorMessage;
    });
  }

  Future<void> _login() async {
    _setLoading(true);
    try {
      User? user = await _authService.signInWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      _setErrorMessage('Failed to login: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _signUp() async {
    _setLoading(true);
    try {
      User? user = await _authService.signUpWithEmailPassword(
        _emailController.text,
        _passwordController.text,
      );
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      _setErrorMessage('Failed to sign up: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _signInWithGoogle() async {
    _setLoading(true);
    try {
      User? user = await _authService.signInWithGoogle();
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      _setErrorMessage('Failed to sign in with Google: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _forgotPassword() async {
    if (_emailController.text.isEmpty) {
      _setErrorMessage('Please enter your email');
      return;
    }

    _setLoading(true);
    try {
      await _authService.sendPasswordResetEmail(_emailController.text);
      _setErrorMessage('Password reset email sent');
    } catch (e) {
      _setErrorMessage('Failed to send password reset email: $e');
    } finally {
      _setLoading(false);
    }
  }
}

