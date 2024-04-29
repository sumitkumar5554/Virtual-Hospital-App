import 'package:flutter/material.dart';

class SignupByDoctorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SignupForm(),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _userIdController,
          decoration: InputDecoration(
            labelText: 'User ID',
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
          obscureText: true,
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Implement signup logic here
            String userId = _userIdController.text;
            String password = _passwordController.text;
            print('User ID: $userId');
            print('Password: $password');
          },
          child: Text('Sign Up'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
