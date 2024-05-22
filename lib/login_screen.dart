import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_swaahth/navbar%20screen/navbar_roots.dart';
import 'package:virtual_swaahth/signup_screen.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passToggle = true;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isLoginEnabled = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_checkLoginEnable);
    _passwordController.addListener(_checkLoginEnable);
    _checkLoginStatus();
  }

  void _checkLoginEnable() {
    setState(() {
      isLoginEnabled = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken');
    if (authToken != null && authToken.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavBarRoots(),
        ),
      );
    }
  }

  Future<void> _setLoginStatus(String authToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', authToken);
  }

  Future<void> _clearLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 90),
              Container(
                height: 200,
                width: 200,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Lottie.network(
                    'https://lottie.host/d1d7a9d7-1617-4bb7-8921-dfe67a76d2d3/HXwX6Z5gXv.json',
                  ),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 350,
                  height: 70,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelText: "Enter Username",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: 350,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: passToggle ? true : false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelText: "Enter Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: passToggle
                              ? Icon(CupertinoIcons.eye_slash_fill)
                              : Icon(CupertinoIcons.eye_fill),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Material(
                    color: isLoginEnabled
                        ? Colors.purple.shade700
                        : Colors.grey, // Change button color based on condition
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: isLoginEnabled
                          ? () async {
                        // Simulate successful login with a token
                        String authToken = 'example_token';
                        // Set login status
                        await _setLoginStatus(authToken);
                        // Navigate to home page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavBarRoots(),
                          ),
                        );
                      }
                          : null, // Disable onTap if conditions are not met
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have any account?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade700,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
