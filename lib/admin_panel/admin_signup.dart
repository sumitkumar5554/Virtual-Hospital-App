import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtual_swaahth/admin_panel/admin_dashboard.dart';
import 'package:virtual_swaahth/admin_panel/admin_login.dart';

class AdminSignupPage extends StatefulWidget {
  @override
  _AdminSignupPageState createState() => _AdminSignupPageState();
}

class _AdminSignupPageState extends State<AdminSignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Store admin details in Firestore
        await FirebaseFirestore.instance
            .collection('admins')
            .doc(userCredential.user!.uid)
            .set({
          'email': _emailController.text.trim(),
          // Add more admin details as needed
        });

        // Navigate to AdminLoginPage after successful signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminLoginPage()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          // Show message if the email is already in use
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You already have an account. Please log in.'),
              backgroundColor: Colors.red,
            ),
          );
          // Navigate to the login page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AdminLoginPage()),
          );
        } else {
          // Show other Firebase Auth errors
          print('Error signing up: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error signing up. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _login() {
    // Navigate to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AdminLoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _signUp,
                child: Text('Sign Up'),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: _login,
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
